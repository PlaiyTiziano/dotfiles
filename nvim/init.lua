require("config")

local map = vim.api.nvim_set_keymap

vim.g.winwidth = 80
vim.g.autowriteall = true
vim.g.smartcase = true
vim.g.noswapfile = true
vim.g.syntax = true

vim.o.ignorecase = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Ultisnips dir
vim.g.UltiSnipsSnippetsDir = "~/.config/nvim/ultisnips"

local options = { noremap = true }

-- Reload
map("n", "<leader>sop", ":source %<CR>", options)

-- Packer install
map("n", "<leader>install", ":PackerInstall<CR>", options)
map("n", "<leader>clean", ":PackerClean<CR>", options)

-- Gitsigns blame
map("n", "<leader>blame", ":Gitsigns toggle_current_line_blame<CR>", options)
map("n", "<leader>flame", ":Gitsigns blame_line<CR>", options)

-- Splitting windows
map("n", "<S-j>", ":split<CR>", options)
map("n", "<S-l>", ":vs<CR>", options)

-- BufferLine keybinds
map("n", "<Tab>", ":BufferLineCycleNext<CR>", options)
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", options)
map("n", "<leader>blp", ":BufferLineCyclePick<CR>", options)

-- Make split navigation easier.
map("n", "<C-H>", "<C-W><C-H>", options)
map("n", "<C-J>", "<C-W><C-J>", options)
map("n", "<C-K>", "<C-W><C-K>", options)
map("n", "<C-L>", "<C-W><C-L>", options)

-- Toggle NvimTree.
map("n", "<leader>n", ":NvimTreeToggle<CR>", options)

-- hopword
map("n", "<leader>hw", ":HopWord<CR>", options)


-- Some more random stuff
map("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float(nil, { focus = false, border = \"single\" })<CR>", options)
map("n", "<leader>tt", "<cmd>TroubleToggle<CR>", options)

map("v", "r", "_dP", {})
