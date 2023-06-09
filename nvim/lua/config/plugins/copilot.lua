return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
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
            require("copilot_cmp").setup()
        end,
    },
}
