require("lazy").setup({
    -- LSP related stuff
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    {
        "windwp/nvim-autopairs",
        config = true,
    },

    -- Cosmetic
    "Shatur/neovim-ayu",
    "catppuccin/nvim",
    "folke/tokyonight.nvim",
    {
        "nvim-tree/nvim-web-devicons",
        config = true,
    },
    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- Utility
    "rcarriga/nvim-notify",
    "vijaymarupudi/nvim-fzf",
    "lukas-reineke/indent-blankline.nvim",
    "voldikss/vim-floaterm",
    "mrjones2014/legendary.nvim",
    {
        "nmac427/guess-indent.nvim",
        config = true,
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("trouble").setup({
                icons = false,
            })
        end,
    },
    {
        "kylechui/nvim-surround",
        config = true,
    },
    {
        "folke/which-key.nvim",
        config = true,
    },
    {
        "numToStr/Comment.nvim",
        config = true,
    },

    -- Git
    {
        "lewis6991/gitsigns.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = true,
    },
    {
        "sindrets/diffview.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    "almo7aya/openingh.nvim",

    -- Snippets
    "SirVer/ultisnips",

    -- Treesitter
    "nvim-treesitter/nvim-treesitter",
    "RRethy/nvim-treesitter-endwise",

    -- Navigation
    "ThePrimeagen/harpoon",
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = true,
    },
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("bufferline").setup({
                highlights = require(
                    "catppuccin.groups.integrations.bufferline"
                ).get(),
            })
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
    },
    {
        "princejoogie/dir-telescope.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("dir-telescope").setup({
                hidden = true,
                respect_gitignore = true,
            })
        end,
    },
    {
        "phaazon/hop.nvim",
        config = true,
    },

    -- Language specific
    -- Rust
    "simrat39/rust-tools.nvim",

    -- Lua
    "ckipp01/stylua-nvim",

    -- Custom plugins
    {
        "aaronhallaert/continuous-testing.nvim",
        dev = true,
    },
}, {
    dev = {
        path = "~/personal/neovim-plugins",
    },
})
