-- Dashboard
require'alpha'.setup(require'alpha.themes.startify'.config)

-- Theme
local ayu = require('ayu')
ayu.setup({
  mirage = true,
  overrides = {},
})
ayu.colorscheme()
-- vim.cmd[[colorscheme tokyonight-moon]]

-- vim.opt.background = 'dark'
-- vim.cmd('colorscheme tundra')
-- require("nvim-tundra").setup({})
