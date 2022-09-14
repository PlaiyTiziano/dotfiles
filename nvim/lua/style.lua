-- Dashboard
require'alpha'.setup(require'alpha.themes.startify'.config)

-- Theme
local ayu = require('ayu')
ayu.setup({
  mirage = true,
  overrides = {},
})
ayu.colorscheme()

-- vim.opt.background = 'dark'
-- vim.cmd('colorscheme tundra')
-- require("nvim-tundra").setup({})
