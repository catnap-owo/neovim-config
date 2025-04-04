local autocmd = vim.api.nvim_create_autocmd

--------------------------------------------------------------------------------------
autocmd('TextYankPost', {
  desc = 'highlight what you have yanked',
  callback = function()
    vim.highlight.on_yank()
  end,
})
--------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------
autocmd('FileType', {
  desc = 'set space num when pressing tab based on the editing file type',
  callback = function(file)
    local type = file['match']
    if type == 'lua' or type == 'nix' then
      vim.opt.shiftwidth = 2
    elseif type == 'c' or type == 'cpp' then
      vim.opt.shiftwidth = 8
    else
      vim.opt.shiftwidth = 4
    end
  end,
})
--------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------
autocmd('LspProgress', {
  desc = 'set LSP inlay hint style',
  callback = function()
    vim.cmd([[highlight LspInlayHint cterm=italic gui=italic guifg=#928374 guibg=#333333]])
  end,
})
--------------------------------------------------------------------------------------
