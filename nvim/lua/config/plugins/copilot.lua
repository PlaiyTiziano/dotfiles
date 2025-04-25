return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        -- event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = false,
                    -- auto_trigger = true,
                    -- debounce = 75,
                    -- keymap = {
                    --     accept = "<C-a>",
                    --     accept_word = false,
                    --     accept_line = false,
                    --     next = "<C-]>",
                    --     prev = "<C-[>",
                    --     dismiss = "<C-j>",
                    -- },
                },
            })
        end,
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end,
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "main",
        dependencies = {
            { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
            { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
        },
        opts = {
            debug = false, -- Enable debugging
            -- See Configuration section for rest
        },
        event = "VeryLazy",
        -- See Commands section for default commands if you want to lazy load on them
    },
}
