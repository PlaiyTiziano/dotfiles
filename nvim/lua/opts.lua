vim.o.ruler = false
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.ignorecase = true
vim.o.hlsearch = true
vim.o.termguicolors = true
vim.o.lazyredraw = true

vim.o.hidden = true
vim.o.updatetime = 300
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.showmode = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.wrap = false

-- Folding
vim.o.foldlevel = 20
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- DISABLE THE FUCKING MOUSE
vim.o.mouse = ""

vim.g.mapleader = " "
vim.b.mapleader = " "

vim.api.nvim_command("set colorcolumn=80")

-- vim.cmd("language en_US.utf-8")
vim.opt.listchars = {
    tab = "┆·",
    trail = "·",
    precedes = "",
    extends = "",
}

vim.opt.list = true

vim.g.markdown_fenced_languages = { "sh", "vim" }

vim.g.termbufm_direction_cmd = "new"
