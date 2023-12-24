-- local base = require("plugins.configs.lspconfig")

local on_attach = require("plugins.configs.lspconfig").on_attach 
local capabilities = require("plugins.configs.lspconfig").capabilities 
-- local on_attach = base.on_attach 
-- local capabilities = base.capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

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
