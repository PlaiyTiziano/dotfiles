local telescope = require("telescope")

telescope.setup({})

telescope.load_extension("harpoon")

local options = { noremap = true }

vim.api.nvim_set_keymap(
    "n",
    "<leader>fg",
    "<cmd>Telescope live_grep<CR>",
    options
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>fb",
    "<cmd>Telescope buffers<CR>",
    options
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>fm",
    "<cmd>Telescope harpoon marks<CR>",
    options
)
vim.api.nvim_set_keymap("n", "<C-p>", "<cmd>Telescope find_files<CR>", options)
