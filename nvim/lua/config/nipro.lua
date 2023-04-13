function _G.Get_test_cmd( --[[optional]]line)
    local test_file = vim.fn.expand("%")
    local line_number = vim.api.nvim_win_get_cursor(0)[1]

    if line then
        return "bundle exec rspec " .. test_file .. ":" .. line_number
    else
        return "bundle exec rspec " .. test_file .. " --no-fail-fast"
    end
end

function _G.Connect_to_nipro_web_container(test_cmd)
    return "execute_api_command -it '" .. test_cmd .. "'"
end

-- Because this is very specific to my working environment I am not placing
-- these in the binds.lua file.
vim.api.nvim_set_keymap(
    "n",
    "<leader>testf",
    ":lua require('FTerm').scratch({ cmd = '' .. Connect_to_nipro_web_container(Get_test_cmd()) })<CR>",
    { noremap = true }
)

vim.api.nvim_set_keymap(
    "n",
    "<leader>testl",
    ":lua require('FTerm').scratch({ cmd = '' .. Connect_to_nipro_web_container(Get_test_cmd(true)) })<CR>",
    { noremap = true }
)
