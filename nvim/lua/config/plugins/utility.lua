return {
    "rcarriga/nvim-notify",
    "lukas-reineke/indent-blankline.nvim",
    "voldikss/vim-floaterm",
    {
        "echasnovski/mini.surround",
        version = "*",
        config = function()
            require("mini.surround").setup()
        end,
    },
    {
        "echasnovski/mini.ai",
        version = "*",
        config = function()
            require("mini.ai").setup()
        end,
    },
    { "nmac427/guess-indent.nvim", config = true },
    { "folke/which-key.nvim", config = true },
    { "numToStr/Comment.nvim", config = true },
    { "simrat39/symbols-outline.nvim", config = true },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("trouble").setup({
                icons = false,
            })
        end,
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

    -- Language specific
    -- Rust
    "simrat39/rust-tools.nvim",

    -- Lua
    "ckipp01/stylua-nvim",
}
