-- Dashboard
require'alpha'.setup(require'alpha.themes.startify'.config)

-- Theme
local ayu = require('ayu')
ayu.setup({
  mirage = true,
  overrides = {},
})
ayu.colorscheme()

-- Notifications style
vim.notify = require('notify')
