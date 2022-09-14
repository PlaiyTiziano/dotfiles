local TEST_STATES = {
  SUCCESS = "passed",
  FAILED = "failed",
  SKIPPED = "pending",
}

local state = {}
local autocmd = nil

local ns = vim.api.nvim_create_namespace("ContinuousRubyTesting")
local group = vim.api.nvim_create_augroup("ContinuousRubyTesting", { clear = true })

local clear_test_results = function ()
  vim.diagnostic.reset(ns, state.bufnr)
  vim.api.nvim_buf_clear_namespace(state.bufnr, ns, 0, -1)

  state.version = nil
  state.seed = nil
  state.tests = {}
  state.diagnostics = {}
end

local on_exit_callback = function ()
  for _, test in pairs(state.tests) do
    local severity = vim.diagnostic.severity.ERROR
    local message = "Test Failed"

     if test.status == TEST_STATES.SUCCESS then
      severity = vim.diagnostic.severity.INFO
      message = "Test Succeeded"
    elseif test.status == TEST_STATES.SKIPPED then
      severity = vim.diagnostic.severity.WARN
      message = "Test Skipped"
    end

    table.insert(state.diagnostics, {
      bufnr = state.bufnr,
      lnum = test.line_number - 1,
      col = 0,
      severity = severity,
      source = "rspec",
      message = message,
      user_data = {},
    })
  end

  vim.diagnostic.set(ns, state.bufnr, state.diagnostics, {})
end

local buf_write_post_callback = function (bufnr, cmd)
  state = {
    bufnr = bufnr,
    version = nil,
    seed = nil,
    tests = {},
    diagnostics = {},
  }

  return function ()
    clear_test_results()

    local append_data = function(_, data)
      if not data then
        return
      end

      for _, line in ipairs(data) do
        if not string.find(line, "{") then
          return
        end

        local decoded = vim.json.decode(line)

        state.version = decoded.version
        state.seed = decoded.seed

        for _, test in pairs(decoded.examples) do
          state.tests[test.file_path .. ":" .. test.line_number] = test

          local text = { nil }
          if test.status == TEST_STATES.SUCCESS then
            text = { "✅" }
          elseif test.status == TEST_STATES.FAILED then
            text = { "❌" }
          elseif test.status == TEST_STATES.SKIPPED then
            text = { "⏭️" }
          else
            text = { "❓" }
          end


          vim.api.nvim_buf_set_extmark(state.bufnr, ns, test.line_number - 1, 0, {
            virt_text = { text },
          })
        end
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

local testing_dialog = function ()
  local test_key = "./" .. vim.fn.expand("%") .. ":" .. vim.fn.line "."

  local test = state.tests[test_key]
  if not test or test.status ~= TEST_STATES.FAILED then
    return
  end

  local message = {
    "Test: " .. test.description,
    "Location: " .. test.file_path .. ":" .. test.line_number,
    "Runtime: " .. test.run_time,
    "Seed: " .. state.seed,
    "",
    "Exception: " .. test.exception.class,
    "Message:",
  }

  for line in string.gmatch(test.exception.message, "[^\r\n]+") do
    table.insert(message, line)
  end

  table.insert(message, "")
  table.insert(message, "Backtrace:")

  for _, line in ipairs(test.exception.backtrace) do
    for backtrace in string.gmatch(line, "[^\r\n]+") do
      table.insert(message, backtrace)
    end
  end

  local width = vim.api.nvim_get_option("columns")
  local height = vim.api.nvim_get_option("lines")

  local win_height = math.ceil(height * 0.8 - 4)
  local win_width = math.ceil(width * 0.8)

  local row = math.ceil((height - win_height) / 2 - 1)
  local col = math.ceil((width - win_width) / 2)

  local opts = {
    style = "minimal",
    relative = "editor",
    width = win_width,
    height = win_height,
    row = row,
    col = col,
    border = "rounded",
  }

  local buffer = vim.api.nvim_create_buf(false, 'nomodified')
  vim.api.nvim_buf_set_lines(buffer, 0, -1, false, message)
  vim.api.nvim_open_win(buffer, true, opts)
end

local attach_autocmd_to_buffer = function (bufnr, pattern, cmd)
  vim.api.nvim_buf_create_user_command(bufnr, "ContinuousRubyTestingDialog", testing_dialog, {})

  vim.api.nvim_create_user_command("StopContinuousRubyTesting", function ()
    vim.api.nvim_del_autocmd(autocmd)
    vim.api.nvim_del_user_command("StopContinuousRubyTesting")
    vim.api.nvim_buf_del_user_command(bufnr, "ContinuousRubyTestingDialog")
    clear_test_results()
  end, {})

  autocmd = vim.api.nvim_create_autocmd("BufWritePost", {
    group = group,
    pattern = pattern,
    callback = buf_write_post_callback(bufnr, cmd)
  })
end

vim.api.nvim_create_user_command("ContinuousRubyTestingFailures", function ()
  vim.diagnostic.setqflist({
    ns = ns,
    open = true,
    title = "Failed tests:",
    severity = vim.diagnostic.severity.ERROR
  })
end, {})

local get_test_cmd = function(file)
  return {
    "docker", "exec", "nephroflow_web_run_a80d11aa125c",
    "spring", "rspec", file,
    "--format", "json",
    "--no-fail-fast",
  }
end

vim.api.nvim_create_user_command("ContinuousRubyTesting", function ()
  local bufnr = vim.api.nvim_get_current_buf()
  local filename = vim.fn.expand("%")

  attach_autocmd_to_buffer(bufnr, "*.rb", get_test_cmd(filename))
end, {})

