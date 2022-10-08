-- Dashboard
-- require'alpha'.setup(require'alpha.themes.startify'.config)
require('style.dashboard')
require('style.statusline')

-- Theme
-- local ayu = require('ayu')
-- ayu.setup({
--   mirage = true,
--   overrides = {},
-- })
-- ayu.colorscheme()

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
require("catppuccin").setup()
vim.api.nvim_command "colorscheme catppuccin"

-- Notifications style
vim.notify = require('notify')
