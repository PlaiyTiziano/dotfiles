return {
    { "catppuccin/nvim" },
    {
        "nvim-tree/nvim-web-devicons",
        event = "VeryLazy",
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
}
