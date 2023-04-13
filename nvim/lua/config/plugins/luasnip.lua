local LAZY_LUASNIP_AUGROUP = "LazyLuaSnip"

local M = {
    "L3MON4D3/LuaSnip",
    version = "v1.1.0",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "saadparwaiz1/cmp_luasnip",
    },
    lazy = true,
    event = "BufEnter",
}

local function start_vscode_loaders()
    require("luasnip.loaders.from_vscode").load({
        paths = {
            "~/dotfiles/nvim/snippets",
            "~/.local/share/nvim/lazy/friendly-snippets",
        },
    })

    vim.api.nvim_clear_autocmds({ group = LAZY_LUASNIP_AUGROUP })
end

function M.config()
    -- Figure out a way to lazy load the loaders
    vim.api.nvim_create_autocmd("BufEnter", {
        pattern = { "*.rb", "*.lua", "*.md" },
        callback = start_vscode_loaders,
        group = vim.api.nvim_create_augroup(LAZY_LUASNIP_AUGROUP, {}),
    })

    local ls = require("luasnip")

    ls.filetype_extend("json", { "json" })
    ls.filetype_extend("ruby", { "rails", "rspec" })
    ls.filetype_extend("markdown", { "qualitydesk" })
    ls.config.setup({
        history = true,
        enable_autosnippets = true,
    })
end

return M
