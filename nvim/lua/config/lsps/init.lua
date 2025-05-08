require("config.lsps.rust")
require("config.lsps.lua_config")
require("config.lsps.nvim-cmp")

local lspconfig = require("lspconfig")

local keymaps = require("config.lsps.keymaps")
local capabilities = require("cmp_nvim_lsp").default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
    "pyright",
    "solargraph",
    "eslint",
    -- "gopls",
    "jsonls",
    "tailwindcss",
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

-- rust_analyzer
lspconfig["rust_analyzer"].setup({
    capabilities = capabilities,
    on_attach = keymaps.setup,
    flags = {
        debounce_text_changes = 150,
    },
    checkOnSave = {
        allFeatures = true,
        overrideCommand = {
            "cargo",
            "clippy",
            "--workspace",
            "--message-format=json",
            "--all-targets",
            "--all-features",
        },
    },
})

-- TSServer
lspconfig.ts_ls.setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false

        keymaps.setup(client, bufnr)
    end,
    flags = {
        debounce_text_changes = 150,
    },
})

lspconfig.emmet_ls.setup({})

-- Golang specific
vim.g["go_def_mode"] = "gopls"
vim.g["go_info_mode"] = "gopls"

lspconfig.gopls.setup({
    filetypes = { "go", "gomod", "gowork", "gotmpl", "templ" },
    capabilities = capabilities,
    on_attach = keymaps.setup,
    flags = {
        debounce_text_changes = 150,
    },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
        },
    },
})
