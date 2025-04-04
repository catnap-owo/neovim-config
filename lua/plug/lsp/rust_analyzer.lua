local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
  on_attach = function(_, _)
    vim.lsp.inlay_hint.enable(true, nil, 0)
  end,
}
