local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.clangd.setup {
  capabilities = capabilities,
  cmd = {
    'clangd',
    -- 在后台自动分析文件（基于complie_commands)
    '--background-index',
    -- 标记compelie_commands.json文件的目录位置
    '--compile-commands-dir=build',
    -- 同时开启的任务数量
    '-j=8',
    -- 更详细的补全内容
    '--completion-style=detailed',
    -- 禁止补全头文件
    '--header-insertion=never',
    -- pch优化的位置 disk memory
    '--pch-storage=memory',
    '--cross-file-rename',
    '--enable-config',
    '--pretty',
    '--clang-tidy',
  }
}
