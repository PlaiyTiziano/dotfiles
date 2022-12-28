return {
    "Shatur/neovim-ayu",
    "catppuccin/nvim",
    "folke/tokyonight.nvim",
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
                    theme = "tokyonight",
                },
            })
        end,
    },
}
