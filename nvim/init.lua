vim.g.winwidth = 80
vim.g.autowriteall = true
vim.g.smartcase = true
vim.g.noswapfile = true
vim.g.syntax = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.ignorecase = true

require("config.lazy")
require("config.lsps")
require("config.nipro")

require("opts")
require("style")

-- Ultisnips dir
vim.g.UltiSnipsSnippetsDir = "~/.config/nvim/ultisnips"

vim.api.nvim_set_keymap("v", "r", "_dP", {})
