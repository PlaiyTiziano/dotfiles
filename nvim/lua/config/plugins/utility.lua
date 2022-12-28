return {
    "rcarriga/nvim-notify",
    "lukas-reineke/indent-blankline.nvim",
    "voldikss/vim-floaterm",
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

    -- Language specific
    -- Rust
    "simrat39/rust-tools.nvim",

    -- Lua
    "ckipp01/stylua-nvim",
}
