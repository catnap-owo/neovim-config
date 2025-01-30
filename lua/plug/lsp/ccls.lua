local lspconfig = require('lspconfig')
local util = require('lspconfig.util')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.ccls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  -- 开启单文件支持
  single_file_support = true,
  -- 根目录获取规则
  root_dir = function(fname)
    return util.root_pattern('compile_commands.json', '.ccls')(fname) or util.find_git_ancestor(fname) or vim.fn.getcwd()
  end,
  -- 初始化参数
  init_options = {
    compilationDatabaseDirectory = "",
    cache = {
      directory = ".ccls-cache"
    },
    client = {
      snippetSupport = true,
    },
    index = {
      threads = 128,
    },
    highlight = {
      lsRanges = true,
    },
    resourceDir = "",
  }
})
