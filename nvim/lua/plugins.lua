vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.cmd('packadd packer.nvim')

return require('packer').startup(
  function(use)
    -- Package manager (lua)
    use 'wbthomason/packer.nvim'

    -- LSP & related plugins
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'windwp/nvim-autopairs'
    use 'folke/tokyonight.nvim'

    -- themes
    use 'tamton-aquib/staline.nvim'
    use 'Shatur/neovim-ayu'

    -- Dashboard
    use {
      'goolord/alpha-nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      -- config = function ()
      --   require'alpha'.setup(require'alpha.themes.startify'.config)
      -- end
    }

    -- Git related
    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
      config = function ()
        require('gitsigns').setup()
      end
    }
    use { 'sindrets/diffview.nvim', requires = { 'nvim-lua/plenary.nvim' } }

    -- snippets
    use 'SirVer/ultisnips'

    -- highlighting
    use 'nvim-treesitter/nvim-treesitter'
    use 'RRethy/nvim-treesitter-endwise'

    -- file-navigation
    use 'ThePrimeagen/harpoon'
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      },
      config = function ()
        require('nvim-tree-conf')
      end
    }
    use {
      'akinsho/bufferline.nvim',
      tag = "v2.*",
      requires = 'kyazdani42/nvim-web-devicons'
    }
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use 'phaazon/hop.nvim'

    -- replacing
    use 'tpope/vim-abolish'

    -- auto-completion
    -- use 'jiangmiao/auto-pairs'
    use 'mattn/emmet-vim'
    use 'tpope/vim-surround'
    use 'ervandew/supertab'

    -- comments
    -- use 'kkoomen/vim-doge'
    use 'tpope/vim-commentary'

    -- general plugins
    use 'vijaymarupudi/nvim-fzf'
    use "lukas-reineke/indent-blankline.nvim"

    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup{}
      end
    }

    use 'voldikss/vim-floaterm'

    -- language specific plugins
    -- go
    use 'fatih/vim-go'

    -- ruby
    use 'tpope/vim-rails'

    -- markdown
    use 'davidgranstrom/nvim-markdown-preview'

    -- rust
    use 'simrat39/rust-tools.nvim'
  end
  )
