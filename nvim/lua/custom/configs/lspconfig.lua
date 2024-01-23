local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach 
local capabilities = configs.capabilities 

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"
-- local servers = { "bash-language-server", "r-languageserver"}

-- for _, lsp in ipairs(servers) do
  -- lspconfig[lsp].setup {
    -- on_attach = on_attach,
    -- capabilities = capabilities,
  -- }
-- end


lspconfig.clangd.setup{
  on_attach = function (client, bufnr)
    client.server_capabilities.signatureHelpProvider = false 
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  filetypes = {"cpp"},
}

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})
