return {
    "Shatur/neovim-ayu",
    "catppuccin/nvim",
    "folke/tokyonight.nvim",
    {
        "loctvl842/monokai-pro.nvim",
        config = function()
            require("monokai-pro").setup({
                filter = "octagon",
                plugins = {
                    bufferline = {
                        underline_selected = false,
                        underline_visible = false,
                    },
                },
            })
        end,
    },
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
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
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = true,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "monokai-pro",
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
