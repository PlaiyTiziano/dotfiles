return {
    "Shatur/neovim-ayu",
    "catppuccin/nvim",
    "folke/tokyonight.nvim",
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        -- config = true,
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "nvim-tree/nvim-web-devicons",
        config = true,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "catppuccin",
                },
            })
        end,
    },
    {
        "echasnovski/mini.animate",
        version = "*",
        config = function()
            require("mini.animate").setup()
        end,
    },
}
