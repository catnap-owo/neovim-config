local map = vim.keymap
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

map.set('v', 'J', ':m \'>+1<CR>gv=gv')
map.set('v', 'K', ':m \'<-2<CR>gv=gv')

map.set('n', '<leader>\\', ':NvimTreeFocus<CR>', { silent = true })
map.set('n', '<leader>tt', ':NvimTreeClose<CR>', { silent = true })

map.set('n', '<leader>nl', ':nohl<CR>', { silent = true })

map.set('n', '<A-Enter>', 'o<ESC>k', { silent = true })
map.set('n', '<S-Enter>', 'O<ESC>j', { silent = true })

local builtin = require('telescope.builtin')
map.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
map.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
map.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
map.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

local lsp_opt = { buffer = bufnr, noremap = true, silent = true }
map.set('n', 'gD', vim.lsp.buf.declaration, lsp_opt)
map.set('n', 'gd', vim.lsp.buf.definition, lsp_opt)
map.set('n', 'K', vim.lsp.buf.hover, lsp_opt)
map.set('n', 'gi', vim.lsp.buf.implementation, lsp_opt)
map.set('n', '<C-k>', vim.lsp.buf.signature_help, lsp_opt)
map.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, lsp_opt)
map.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, lsp_opt)
map.set('n', '<space>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, lsp_opt)
map.set('n', '<space>D', vim.lsp.buf.type_definition, lsp_opt)
map.set('n', '<space>rn', vim.lsp.buf.rename, lsp_opt)
map.set('n', 'gr', vim.lsp.buf.references, lsp_opt)
map.set('n', '<space>e', vim.diagnostic.open_float, lsp_opt)
map.set('n', '[d', vim.diagnostic.goto_prev, lsp_opt)
map.set('n', ']d', vim.diagnostic.goto_next, lsp_opt)
map.set('n', '<space>q', vim.diagnostic.setloclist, lsp_opt)
map.set('n', '<leader>ca', vim.lsp.buf.code_action, lsp_opt)

map.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
map.set("t", "<C-h>", "<Cmd> wincmd h<CR>", { noremap = true, silent = true })
map.set("t", "<C-j>", "<Cmd> wincmd j<CR>", { noremap = true, silent = true })
map.set("t", "<C-k>", "<Cmd> wincmd k<CR>", { noremap = true, silent = true })
map.set("t", "<C-l>", "<Cmd> wincmd l<CR>", { noremap = true, silent = true })

