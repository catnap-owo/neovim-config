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
  end,

})
autocmd('FileType', {
  desc = 'set space num when pressing tab based on the editing file type',
  callback = function(file)
    local type = file['match']
    if type == 'lua' or type == 'nix' then
      vim.opt.shiftwidth = 2
    else
      vim.opt.shiftwidth = 4
    end
  end,
})
--------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------
local flash_hint = 0

autocmd('LspAttach', {
  callback = function(_)
    flash_hint = 0
    vim.cmd([[highlight LspInlayHint guibg=#474747]])
  end
})

-- I have no idea except this trash, save me :)
autocmd('LspProgress', {
  callback = function(_)
    if not flash_hint then
      return
    end
    flash_hint = flash_hint + 1
    vim.lsp.inlay_hint.enable(true, nil)
    if flash_hint > 200 then
      flash_hint = nil
    end
  end
})

autocmd('LspNotify', {
  callback = function(_)
    vim.lsp.inlay_hint.enable(true, nil)
  end
})
--------------------------------------------------------------------------------------

