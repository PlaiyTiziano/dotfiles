-- Dashboard
require("style.dashboard")
require("style.statusline")

-- Theme
-- local ayu = require("ayu")
-- ayu.setup({
--     mirage = true,
--     overrides = {},
-- })
-- ayu.colorscheme()

vim.cmd[[colorscheme tokyonight-moon]]


-- Notifications style
vim.notify = require("notify")
