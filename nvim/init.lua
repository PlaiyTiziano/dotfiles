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

-- Ultisnips dir
vim.g.UltiSnipsSnippetsDir = "~/.config/nvim/ultisnips"

vim.api.nvim_set_keymap("v", "r", "_dP", {})
