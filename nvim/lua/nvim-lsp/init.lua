require('nvim-lsp.rust')
require('nvim-lsp.lua_config')
require('nvim-lsp.nvim-cmp')

local lspconfig = require('lspconfig')

local keymaps = require('nvim-lsp.keymaps')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
  'pyright',
  'rust_analyzer',
  'tsserver',
  'eslint',
  'solargraph',
  'gopls'
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    on_attach = keymaps.setup,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- Golang specific
vim.g["go_def_mode"] = "gopls"
vim.g["go_info_mode"] = "gopls"
