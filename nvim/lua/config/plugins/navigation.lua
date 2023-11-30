return {
    -- Navigate between buffers
    {
        "ThePrimeagen/harpoon",
        config = true,
        event = "VeryLazy",
    },
    {
        "akinsho/bufferline.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = true,
        opts = {
            highlights = require("catppuccin.groups.integrations.bufferline").get(),
        },
        event = "VeryLazy",
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")

            telescope.setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<c-e>"] = function(prompt_bufnr)
                                actions.select_default(prompt_bufnr)
                                require("telescope.builtin").resume()
                            end,
                            ["<c-s>"] = actions.send_selected_to_qflist
                                + actions.open_qflist,
                            ["<c-a>"] = actions.add_selected_to_qflist
                                + actions.open_qflist,

                            ["<a-a>"] = function(_prompt_bufnr)
                                vim.notify("Triggered", vim.log.levels.INFO)
                            end,
                        },
                        n = {
                            ["<c-e>"] = function(prompt_bufnr)
                                actions.select_default(prompt_bufnr)
                                require("telescope.builtin").resume()
                            end,
                            ["<c-s>"] = actions.send_selected_to_qflist
                                + actions.open_qflist,
                            ["<c-a>"] = actions.add_selected_to_qflist
                                + actions.open_qflist,
                        },
                    },
                },
                pickers = {
                    colorscheme = {
                        enable_preview = true,
                    },
                },
                extensions = {
                    advanced_git_search = {
                        diff_plugin = "fugitive",
                        git_flags = {},
                        git_diff_flags = {},
                    },
                },
            })
            telescope.load_extension("harpoon")
            telescope.load_extension("advanced_git_search")
        end,
    },

    -- Select a folder and the grep for a string inside said folder
    {
        "princejoogie/dir-telescope.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = true,
        opts = {
            hidden = true,
            respect_gitignore = true,
        },
        event = "VeryLazy",
    },

    -- Navigate inside of a buffer
    { "phaazon/hop.nvim", config = true, event = "VeryLazy" },
}
