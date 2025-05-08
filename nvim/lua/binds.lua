return {
    keymaps = {
        -- Defaults
        {
            "<leader>sop",
            ":source %<CR>",
            description = "Sources the current file",
        },
        -- {
        --     "<leader>bd",
        --     ":bd!<CR>",
        --     description = "Closes a buffer with a bang!",
        -- },
        {
            "<leader>e",
            '<cmd>lua vim.diagnostic.open_float(nil, { focus = false, border = "single" })<CR>',
            description = "Open an error window",
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

        -- Neotree
        {
            "<leader>n",
            ":Neotree toggle<CR>",
            description = "Toggle NeoTree",
        },
        {
            "<leader>nr",
            "<cmd>Neotree reveal<CR>",
            description = "Reveal current file in NeoTree",
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
            "<C-t>",
            ":lua require('FTerm').toggle()<CR>",
            description = "Toggle a Floating Terminal",
        },

        -- Formatting
        {
            "<leader>fjson",
            ":%!prettier --stdin-filepath %<CR>",
            description = "JSON format the current file",
        },

        -- Harpoon
        {
            "<leader>hm",
            ":lua require('harpoon.mark').add_file()<CR>",
            description = "Mark a file with harpoon",
        },
        {
            "<leader>ht",
            ":lua require('harpoon.mark').toggle_file()<CR>",
            description = "Toggle mark a file with harpoon",
        },

        {
            "<leader>gn",
            ":lua require('harpoon.ui').nav_next()<CR>",
            description = "Go to the next marked file",
        },
        {
            "<leader>gp",
            ":lua require('harpoon.ui').nav_prev()<CR>",
            description = "Go to the previous marked file",
        },
        {
            "<leader>h1",
            "<cmd>lua require('harpoon.ui').nav_file(1)<CR>",
            description = "Go to the first mark",
        },
        {
            "<leader>h2",
            "<cmd>lua require('harpoon.ui').nav_file(2)<CR>",
            description = "Go to the second mark",
        },
        {
            "<leader>h3",
            "<cmd>lua require('harpoon.ui').nav_file(3)<CR>",
            description = "Go to the third mark",
        },
        {
            "<leader>h4",
            "<cmd>lua require('harpoon.ui').nav_file(4)<CR>",
            description = "Go to the fourth mark",
        },

        -- Telescope
        -- {
        --     "<leader>fg",
        --     ":Telescope live_grep<CR>",
        --     description = "Grep in all files",
        -- },
        -- {
        --     "<leader>fb",
        --     ":Telescope buffers<CR>",
        --     description = "Search for a specific buffer",
        -- },
        -- {
        --     "<leader>fm",
        --     ":Telescope harpoon marks<CR>",
        --     description = "Search for a specific marked file",
        -- },
        -- {
        --     "<C-p>",
        --     ":Telescope find_files<CR>",
        --     description = "Search for a specific file",
        -- },
    },
}
