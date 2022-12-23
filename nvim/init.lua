vim.g.winwidth = 80
vim.g.autowriteall = true
vim.g.smartcase = true
vim.g.noswapfile = true
vim.g.syntax = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.ignorecase = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("config")

local map = vim.api.nvim_set_keymap

-- Ultisnips dir
vim.g.UltiSnipsSnippetsDir = "~/.config/nvim/ultisnips"

local options = { noremap = true }

-- Reload
map("n", "<leader>sop", ":source %<CR>", options)

-- Gitsigns blame
map("n", "<leader>blame", ":Gitsigns toggle_current_line_blame<CR>", options)
map("n", "<leader>flame", ":Gitsigns blame_line<CR>", options)

-- Splitting windows
map("n", "<S-j>", ":split<CR>", options)
map("n", "<S-l>", ":vs<CR>", options)

-- BufferLine keybinds
map("n", "<leader>bd", ":bd!<CR>", options)
map("n", "<Tab>", ":BufferLineCycleNext<CR>", options)
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", options)
map("n", "<leader>blp", ":BufferLinePick<CR>", options)

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
map(
    "n",
    "<leader>e",
    '<cmd>lua vim.diagnostic.open_float(nil, { focus = false, border = "single" })<CR>',
    options
)
map("n", "<leader>tt", "<cmd>TroubleToggle<CR>", options)
map("n", "<leader>fjson", ":%!jq .<CR>", options)

map("v", "r", "_dP", {})
