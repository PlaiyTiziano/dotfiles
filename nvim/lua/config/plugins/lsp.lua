return {
    {
        "neovim/nvim-lspconfig",
        event = "VeryLazy",
    },

    "folke/neodev.nvim", -- Neovim development helper

    {
        "hrsh7th/nvim-cmp",
        opts = {
            performance = {
                debounce = 0,
                throttle = 0,
            },
        },
    },
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "onsails/lspkind.nvim",
    {
        "windwp/nvim-autopairs",
        config = true,
    },
}
