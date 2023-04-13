return {
    "numToStr/FTerm.nvim",
    config = function()
        local fterm = require("FTerm")

        local lazygit_term = fterm:new({
            ft = "lazygit",
            cmd = "lazygit",
            dimensions = {
                height = 0.9,
                width = 0.9,
            },
        })

        vim.keymap.set("n", "<leader>lg", function()
            lazygit_term:toggle()
        end)

        fterm.setup({})
    end,
}
