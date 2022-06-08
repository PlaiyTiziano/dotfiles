vim.cmd('packadd packer.nvim')

return require('packer').startup(
  function()
    -- LSP & related plugins
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'windwp/nvim-autopairs'

    -- themes
    use 'tamton-aquib/staline.nvim'
    use 'tanvirtin/monokai.nvim'
    use 'nxvu699134/vn-night.nvim'

    -- Dashboard
    use {
      'goolord/alpha-nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
      end
    }

    -- Zen mode
    use {
      "folke/zen-mode.nvim",
      config = function()
        require("zen-mode").setup({
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        })
      end
    }

    -- Git related
    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
      config = require('gitsigns').setup()
    }

    use {
      'pwntester/octo.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        'kyazdani42/nvim-web-devicons',
      },
      config = function ()
        require"octo".setup()
      end
    }

    -- snippets
    use 'SirVer/ultisnips'

    -- highlighting
    use 'nvim-treesitter/nvim-treesitter'

    -- Package manager (lua)
    use 'wbthomason/packer.nvim'

    -- file-navigation
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      },
      config = require('nvim-tree-conf')
    }
    use 'mkitt/tabline.vim'
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    -- replacing
    use 'tpope/vim-abolish'

    -- auto-completion
    -- use 'jiangmiao/auto-pairs'
    use 'mattn/emmet-vim'
    use 'tpope/vim-surround'
    use 'ervandew/supertab'

    -- comments
    use 'kkoomen/vim-doge'
    use 'tpope/vim-commentary'

    -- general plugins
    use 'vijaymarupudi/nvim-fzf'

    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup{}
      end
    }

    -- language specific plugins
    -- go
    use 'fatih/vim-go'

    -- ruby
    use 'tpope/vim-rails'

    -- markdown
    use 'davidgranstrom/nvim-markdown-preview'
  end
  )
