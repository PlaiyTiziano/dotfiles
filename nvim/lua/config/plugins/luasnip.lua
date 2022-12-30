local M = {
    "L3MON4D3/LuaSnip",
    version = "v1.1.0",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "saadparwaiz1/cmp_luasnip",
    },
}

function M.config()
    require("luasnip.loaders.from_vscode").load({
        paths = {
            "~/dotfiles/nvim/snippets",
            "~/.local/share/nvim/lazy/friendly-snippets",
        },
    })

    local ls = require("luasnip")

    -- ls.filetype_extend("json", { "json" })
    ls.filetype_extend("ruby", { "rails", "rspec" })
    ls.config.setup({
        history = true,
        enable_autosnippets = true,
    })
end

return M
