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

function _G.Send_cmd(term_id, cmd)
    require("harpoon.term").sendCommand(term_id, cmd)
end

function _G.Go_to_term(term_id)
    require("harpoon.term").gotoTerminal(term_id)
end

-- Because this is very specific to my working environment I am not placing
-- these in the binds.lua file.
vim.api.nvim_set_keymap(
    "n",
    "<leader>testf",
    ":lua Send_cmd(1, Connect_to_nipro_web_container(Get_test_cmd()))<CR>:lua Go_to_term(1)<CR>i<CR><C-\\><C-n>",
    { noremap = true }
)

vim.api.nvim_set_keymap(
    "n",
    "<leader>testl",
    ":lua Send_cmd(1, Connect_to_nipro_web_container(Get_test_cmd(true)))<CR>:lua Go_to_term(1)<CR>i<CR><C-\\><C-n>",
    { noremap = true }
)
