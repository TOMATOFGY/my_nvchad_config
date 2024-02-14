local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
-- 填写这个网页下的列表 https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = { "html", "cssls", "tsserver", "clangd", "rust_analyzer" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- 每新加一个语言服务器,都需要在这里手动设置开启.

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
}

-- 
-- lspconfig.pyright.setup { blabla}
