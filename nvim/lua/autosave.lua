local TEST_STATES = {
  SUCCESS = "success",
  FAILED = "failed",
  SKIPPED = "skipped",
}

local state = {}

local ns = vim.api.nvim_create_namespace("AutoTesting")
local group = vim.api.nvim_create_augroup("AutoTesting", { clear = true })

local get_filename_and_line_number_from_location = function (location)
  local words = {}
  for word in string.gmatch(location, "[^:]+") do
    table.insert(words, word)
  end

  return { filename = words[1], line_number = tonumber(words[2], 10) }
end

local add_rspec_test = function (line)
  local decoded = vim.json.decode(line)
  local file_info = get_filename_and_line_number_from_location(decoded.location)

  state.tests[decoded.location] = {
    file_name = file_info.filepath,
    line_number = file_info.line_number - 1,
    state = decoded.state,
    message = decoded.message,
  }

  return state.tests[decoded.location]
end

local on_exit_callback = function ()
  local diagnostics = {}
  for _, test in pairs(state.tests) do
    local severity = vim.diagnostic.severity.ERROR
    local message = "Test Failed"

     if test.state == TEST_STATES.SUCCESS then
      severity = vim.diagnostic.severity.INFO
      message = "Test Succeeded"
    elseif test.state == TEST_STATES.SKIPPED then
      severity = vim.diagnostic.severity.WARN
      message = "Test Skipped"
    end

    table.insert(diagnostics, {
      bufnr = state.bufnr,
      lnum = test.line_number,
      col = 0,
      severity = severity,
      source = "rspec",
      message = message,
      user_data = {},
    })
  end

  vim.diagnostic.set(ns, state.bufnr, diagnostics, {})
end

local buf_write_post_callback = function (bufnr, cmd)
  state = {
    bufnr = bufnr,
    tests = {}
  }

  return function ()
    vim.api.nvim_buf_clear_namespace(state.bufnr, ns, 0, -1)

    local append_data = function(_, data)
      if not data then
        return
      end

      for _, line in ipairs(data) do
        if not string.find(line, "{") then
          return
        end

        -- decoded.state, decoded.location, decoded.message
        local test = add_rspec_test(line)

        local text = { nil }
        if test.state == TEST_STATES.SUCCESS then
          text = { "✅" }
        elseif test.state == TEST_STATES.FAILED then
          text = { "❌" }
        elseif test.state == TEST_STATES.SKIPPED then
          text = { "⏭️" }
        else
          text = { "❓" }
        end

        vim.api.nvim_buf_set_extmark(state.bufnr, ns, test.line_number, 0, {
          virt_text = { text },
        })
      end
    end

    vim.fn.jobstart(cmd,
    {
      stdout_buffered = true,
      on_stdout = append_data,
      on_stderr = append_data,
      on_exit = on_exit_callback,
    })
  end
end

local attach_autocmd_to_buffer = function (bufnr, pattern, cmd)
  vim.api.nvim_buf_create_user_command(bufnr, "AutoTestLineDialog", function ()
    local test_key = "./" .. vim.fn.expand("%") .. ":" .. vim.fn.line "."
    print(test_key)

    local test = state.tests[test_key]
    if not test or test.state ~= TEST_STATES.FAILED then
      return
    end

    local message = {}
    for line in string.gmatch(test.message, "[^\r\n]+") do
      table.insert(message, line)
    end

    vim.api.nvim_command('new')
    vim.api.nvim_buf_set_lines(vim.api.nvim_get_current_buf(), 0, -1, false, message)
  end, {})

  vim.api.nvim_create_autocmd("BufWritePost", {
    group = group,
    pattern = pattern,
    callback = buf_write_post_callback(bufnr, cmd)
  })
end

local get_test_cmd = function(file)
  return {
    "docker", "exec", "nephroflow_web_run_a7ecea03b7be",
    "spring", "rspec", file,
    "--require", "./custom_formatter.rb",
    "--format", "CustomFormatter",
    "--no-fail-fast",
  }
end

vim.api.nvim_create_user_command("AutoTesting", function ()
  local bufnr = vim.api.nvim_get_current_buf()
  local filename = vim.fn.expand("%")

  attach_autocmd_to_buffer(bufnr, "*.rb", get_test_cmd(filename))
end, {})

