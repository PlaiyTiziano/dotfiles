return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            animate = {
                -- Can't seem to make this work
                duration = 20, -- ms per step
                easing = "linear",
                fps = 60, -- frames per second. Global setting for all animations
            },
            dashboard = {
                example = "chafa",
                sections = {
                    {
                        section = "terminal",
                        cmd = "chafa ~/Pictures/wallpapers/wallpaper-3.jpg --format symbols --symbols vhalf --size 60x15 --stretch; sleep .1",
                        height = 15,
                        padding = 1,
                    },
                    {
                        pane = 2,
                        { section = "keys", gap = 1, padding = 1 },
                        { section = "startup" },
                    },
                },
            },
            lazygit = { enabled = true },
            zen = { enabled = true },
            scroll = { enabled = true },
            indent = { enabled = true },
            picker = { enabled = true },
        },
        keys = {
            -- Picker
            {
                "<leader>fb",
                function()
                    Snacks.picker.buffers()
                end,
                desc = "Buffers",
            },
            {
                "<leader>fg",
                function()
                    Snacks.picker.grep()
                end,
                desc = "Grep",
            },
            {
                "<C-p>",
                function()
                    Snacks.picker.files()
                end,
                desc = "Find Files",
            },
            {
                "<leader>fr",
                function()
                    Snacks.picker.recent()
                end,
                desc = "Recent",
            },

            -- Picker.lsp
            {
                "gd",
                function()
                    Snacks.picker.lsp_definitions()
                end,
                desc = "Goto Definition",
            },
            {
                "gr",
                function()
                    Snacks.picker.lsp_references()
                end,
                nowait = true,
                desc = "References",
            },
            -- { "gI",         function() Snacks.picker.lsp_implementations() end,  desc = "Goto Implementation" },
            -- { "gy",         function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
            {
                "<leader>fs",
                function()
                    Snacks.picker.lsp_symbols()
                end,
                desc = "LSP Symbols",
            },

            -- Zen
            {
                "<leader>z",
                function()
                    Snacks.zen()
                end,
                desc = "Toggle Zen Mode",
            },
            {
                "<leader>Z",
                function()
                    Snacks.zen.zoom()
                end,
                desc = "Toggle Zoom",
            },

            -- Lazygit
            {
                "<leader>lg",
                function()
                    Snacks.lazygit()
                end,
                desc = "Lazygit",
            },

            -- Buffer management
            {
                "<leader>bd",
                function()
                    Snacks.bufdelete()
                end,
                desc = "Delete Buffer",
            },
        },
    },
}
