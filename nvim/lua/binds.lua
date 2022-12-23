vim.api.nvim_set_keymap(
    "n",
    "<leader>ftn",
    ":FloatermNew<CR>",
    { noremap = false }
)
vim.api.nvim_set_keymap(
    "n",
    "<C-t>",
    ":FloatermToggle<CR>",
    { noremap = false }
)
vim.api.nvim_set_keymap(
    "n",
    "<space>lg",
    ":FloatermNew --height=0.90 --width=0.90 lazygit<CR>",
    { noremap = false }
)

-- Nipro (tmp fix to attach into container)
vim.api.nvim_set_keymap("n", "<C-9>", ":FloatermSend <CR>", { noremap = false })
vim.api.nvim_set_keymap("n", "<Esc>", "<C-\\><C-n>", { noremap = false })
