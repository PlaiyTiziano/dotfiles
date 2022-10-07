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

-- Custom plugins
require("continuous-testing").setup({
  test_command = {
    ruby_rspec = "execute_api_command 'bundle exec spring rspec %file --format json --no-fail-fast'"
  }
})
