vim.g.winwidth = 80
vim.g.autowriteall = true
vim.g.smartcase = true
vim.g.swapfile = false
vim.g.syntax = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.ignorecase = true

require("config.lazy")
require("config.lsps")
require("config.nipro")

require("opts")
require("style")

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*.rb" },
    callback = function()
        vim.cmd("lcd ./")
    end,
})
vim.api.nvim_set_keymap("v", "r", "_dP", {})
-- vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
