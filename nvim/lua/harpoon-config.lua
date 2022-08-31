require("harpoon").setup({})

local options = { noremap = true }

-- Marks
vim.api.nvim_set_keymap("n", "<leader>hm", ":lua require('harpoon.mark').add_file()<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>ht", ":lua require('harpoon.mark').toggle_file()<CR>", options)

vim.api.nvim_set_keymap("n", "<leader>gn", ":lua require('harpoon.ui').nav_next()<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>gp", ":lua require('harpoon.ui').nav_prev()<CR>", options)

vim.api.nvim_set_keymap("n", "<C-h>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", options)
