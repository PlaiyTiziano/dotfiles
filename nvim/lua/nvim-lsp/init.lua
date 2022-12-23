require("nvim-lsp.rust")
require("nvim-lsp.lua_config")
require("nvim-lsp.nvim-cmp")

local lspconfig = require("lspconfig")

local keymaps = require("nvim-lsp.keymaps")
local capabilities = require("cmp_nvim_lsp").default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
    "pyright",
    "rust_analyzer",
    "solargraph",
    "eslint",
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
        client.server_capabilities.documentFormattingProvider = false

        keymaps.setup(client, bufnr)
    end,
    flags = {
        debounce_text_changes = 150,
    },
})

-- Golang specific
vim.g["go_def_mode"] = "gopls"
vim.g["go_info_mode"] = "gopls"

local patterns = {
    "*.rb",
    "*.js",
    "*.ts",
    "*.tsx",
    "*.jsx",
    "*.go",
    -- "*.md",
    "*.json",
}

-- Format lua files
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.lua",
    callback = function()
        require("stylua-nvim").format_file()
    end,
})

-- Format file after writing it
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = patterns,
    callback = function()
        vim.lsp.buf.format({ async = true })
    end,
})
