return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        event = "VeryLazy",
        config = true,
        opts = {
            window = {
                mappings = {
                    ["?"] = "",
                    ["/"] = "",
                },
            },
            filesystem = {
                filtered_items = { visible = true },
            },
            -- Add this section only if you've configured source selector.
            source_selector = {
                winbar = true,
                statusline = true,
                sources = {
                    { source = "filesystem", display_name = " 󰉓 Files " },
                    { source = "git_status", display_name = " 󰊢 Git " },
                    { source = "buffers", display_name = "  Buffers " },
                },
            },
        },
    },
}
