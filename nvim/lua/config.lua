require('plugins')
require('opts')
require('style')

require('binds')
require('treesitter')
require('statusline')

require('telescope-config')
require('harpoon-config')

require('continuous-testing')

-- LSP's
require('nvim-lsp')

-- Setup certain plugins
require('nvim-autopairs').setup{}

require('hop').setup()

require('bufferline').setup()

-- require('telescope').load_extension('harpoon')

-- require("packer").startup(function(use)
--   use 'wbthomason/packer.nvim'
-- end)
