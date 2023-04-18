return {
    { "Shatur/neovim-ayu", event = "VeryLazy" },
    { "catppuccin/nvim" },
    { "folke/tokyonight.nvim", event = "VeryLazy" },
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        -- config = true,
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
        event = "VeryLazy",
    },
    {
        "nvim-tree/nvim-web-devicons",
        config = true,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = true,
        opts = {
            options = {
                theme = "catppuccin",
            },
        },
        event = "VeryLazy",
    },
    {
        "echasnovski/mini.animate",
        version = "*",
        config = function()
            require("mini.animate").setup()
        end,
    },
}
