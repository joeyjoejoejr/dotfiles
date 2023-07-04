local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.nvim_workspace()
lsp.configure("solargraph", {
 cmd = {'bundle', 'exec', 'solargraph', 'stdio'}
})
local cmp_mappings = lsp.defaults.cmp_mappings()
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.setup()
require("fidget").setup({})

vim.diagnostic.config({
  virtual_text = true
})
