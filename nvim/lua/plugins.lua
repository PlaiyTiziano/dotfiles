vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.cmd("packadd packer.nvim")

return require("packer").startup(function(use)
    -- Package manager (lua)
    use("wbthomason/packer.nvim")

    -- LSP & related plugins
    use("neovim/nvim-lspconfig")
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    })
    -- use("jose-elias-alvarez/null-ls.nvim")

    use({
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup({})
        end,
    })

    -- themes
    -- use 'tamton-aquib/staline.nvim'
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true },
    })
    use("Shatur/neovim-ayu")
    use("catppuccin/nvim")

    -- Dashboard
    use({
        "goolord/alpha-nvim",
        requires = { "nvim-tree/nvim-web-devicons" },
    })

    -- Git related
    use({
        "lewis6991/gitsigns.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("gitsigns").setup()
        end,
    })
    use({ "sindrets/diffview.nvim", requires = { "nvim-lua/plenary.nvim" } })
    use("almo7aya/openingh.nvim")

    -- snippets
    use("SirVer/ultisnips")

    -- treesitter
    use("nvim-treesitter/nvim-treesitter")
    use("RRethy/nvim-treesitter-endwise")

    -- file-navigation
    use("ThePrimeagen/harpoon")
    use({
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icon
        },
        config = function()
            require("nvim-tree-conf")
        end,
    })
    use({
        "akinsho/bufferline.nvim",
        tag = "v2.*",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("bufferline").setup({
                options = {
                    -- diagnostics = "nvim_lsp",
                    -- diagnostics_indicator = function(_count, _level, diagnostics_dict)
                    --     local s = " "
                    --     for e, n in pairs(diagnostics_dict) do
                    --         local sym = e == "error" and " "
                    --             or (e == "warning" and " " or "")
                    --         s = s .. " " .. n .. " " .. sym
                    --     end
                    --     return s
                    -- end,
                    -- diagnostics_indicator = function(count, level)
                    --     local icon = level:match("error") and " " or " "
                    --     return " " .. icon .. count
                    -- end,
                    separator_style = "slant",
                },
                highlights = require(
                    "catppuccin.groups.integrations.bufferline"
                ).get(),
            })
        end,
    })
    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    })
    use({
        "princejoogie/dir-telescope.nvim",
        -- telescope.nvim is a required dependency
        requires = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("dir-telescope").setup({
                hidden = true,
                respect_gitignore = true,
            })
        end,
    })
    use({
        "phaazon/hop.nvim",
        config = function()
            require("hop").setup({})
        end,
    })

    -- Commenting
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })

    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    })

    -- general plugins
    use("vijaymarupudi/nvim-fzf")
    use("lukas-reineke/indent-blankline.nvim")
    use({
        "nmac427/guess-indent.nvim",
        config = function()
            require("guess-indent").setup({})
        end,
    })

    -- Notifications
    use("rcarriga/nvim-notify")

    use({
        "folke/trouble.nvim",
        requires = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("trouble").setup({
                icons = false,
            })
        end,
    })

    use("voldikss/vim-floaterm")

    -- Continuous testing
    use("~/personal/neovim-plugins/continuous-testing.nvim")

    -- language specific plugins
    -- go
    use("fatih/vim-go")

    -- ruby
    use("tpope/vim-rails")

    -- markdown
    use("davidgranstrom/nvim-markdown-preview")

    -- rust
    use("simrat39/rust-tools.nvim")
end)
