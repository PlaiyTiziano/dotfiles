local legendary_config = {
    keymaps = {
        -- Defaults
        {
            "<leader>sop",
            ":source %<CR>",
            description = "Sources the current file",
        },
        {
            "<leader>bd",
            ":bd!",
            description = "Closes a buffer with a bang!",
        },
        {
            "<leader>e",
            '<cmd>lua vim.diagnostic.open_float(nil, { focus = false, border = "single" })<CR>',
            description = "Open an error window",
        },
        {
            "r",
            "_dP"
        },

        -- Window management
        {
            "<S-j>",
            ":split<CR>",
            description = "Split horizontally",
        },
        {
            "<S-l>",
            ":vs<CR>",
            description = "Split vertically",
        },

        -- Window navigation
        {
            "<C-H>",
            "<C-W><C-H>",
            description = "Focus the left pane",
        },
        {
            "<C-J>",
            "<C-W><C-J>",
            description = "Focus the bottom pane",
        },
        {
            "<C-K>",
            "<C-W><C-K>",
            description = "Focus the top pane",
        },
        {
            "<C-L>",
            "<C-W><C-L>",
            description = "Focus the right pane",
        },

        -- Trouble
        {
            "<leader>tt",
            ":TroubleToggle<CR>",
            description = "Toggle Trouble",
        },

        -- NvimTree
        {
            "<leader>n",
            ":NvimTreeToggle<CR>",
            description = "Toggle NvimTree",
        },

        -- HopWord
        {
            "<leader>hw",
            ":HopWord<CR>",
            description = "Hop words",
        },

        -- Bufferline
        {
            "<Tab>",
            ":BufferLineCycleNext<CR>",
            description = "Go to the next buffer",
        },
        {
            "<S-Tab>",
            ":BufferLineCyclePrev<CR>",
            description = "Go to the previous buffer",
        },
        {
            "<leader>blp",
            ":BufferLinePick<CR>",
            description = "Pick a buffer",
        },

        -- Git
        {
            "<leader>blame",
            ":Gitsigns toggle_current_line_blame<CR>",
            description = "Toggle git blame line",
        },
        {
            "<leader>flame",
            ":Gitsigns blame_line<CR>",
            description = "Git blame the current line",
        },

        -- FloaTerms
        {
            "<leader>lg",
            ":FloatermNew --height=0.90 --width=0.90 lazygit<CR>",
            description = "LazyGit",
        },
        {
            "<C-t>",
            ":FloatermToggle<CR>",
            description = "Toggle a Floating Terminal",
        },

        -- Formatting
        {
            "<leader>fjson",
            ":%jq.<CR>",
            description = "JSON format the current file",
        },
    },
}

require("legendary").setup(legendary_config)
