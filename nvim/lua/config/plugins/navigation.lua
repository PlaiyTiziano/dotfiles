return {
    "vijaymarupudi/nvim-fzf",
    { "ThePrimeagen/harpoon", config = true },
    { "phaazon/hop.nvim", config = true },
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
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            local telescope = require("telescope")

            telescope.setup({
                pickers = {
                    colorscheme = {
                        enable_preview = true
                    }
                }
            })
            telescope.load_extension("harpoon")
        end,
    },
}
