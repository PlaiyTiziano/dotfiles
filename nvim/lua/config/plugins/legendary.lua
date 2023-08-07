local bindings = require("binds")

return {
    {
        "mrjones2014/legendary.nvim",
        event = "VeryLazy",
        config = function()
            require("legendary").setup(bindings)
        end,
    },
}
