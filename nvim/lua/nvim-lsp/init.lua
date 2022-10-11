require("nvim-lsp.rust")
require("nvim-lsp.lua_config")
require("nvim-lsp.nvim-cmp")

local lspconfig = require("lspconfig")

local keymaps = require("nvim-lsp.keymaps")
local capabilities = require("cmp_nvim_lsp").update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
    "pyright",
    "rust_analyzer",
    "solargraph",
    "gopls",
}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        capabilities = capabilities,
        on_attach = keymaps.setup,
        flags = {
            debounce_text_changes = 150,
        },
    })
end

-- TSServer
lspconfig.tsserver.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        keymaps.setup(client, bufnr)
        client.resolved_capabilities.document_formatting = false
    end,
    flags = {
        debounce_text_changes = 150,
    },
})

-- Golang specific
vim.g["go_def_mode"] = "gopls"
vim.g["go_info_mode"] = "gopls"

local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.eslint,
        null_ls.builtins.formatting.jq,
    },
})

local patterns = {
    "*.rb",
    "*.js",
    "*.ts",
    "*.tsx",
    "*.jsx",
    "*.lua",
    "*.go",
    "*.md",
    "*.json",
}

-- Format file after writing it
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = patterns,
    callback = function()
        vim.lsp.buf.format({ async = true })
    end,
})
