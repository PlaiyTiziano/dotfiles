local bindings = require("binds")

return {
    {
        "mrjones2014/legendary.nvim",
        config = function()
            require("legendary").setup(bindings)
        end,
    },
}
