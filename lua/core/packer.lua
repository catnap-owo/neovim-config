local plugs = {
  'nvim-tree/nvim-web-devicons',
  gruvbox = "ellisonleao/gruvbox.nvim",
  autopairs = 'windwp/nvim-autopairs',
  tree = 'nvim-tree/nvim-tree.lua',
  lsp = 'neovim/nvim-lspconfig',
  cmp = 'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-path',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  lualine = 'nvim-lualine/lualine.nvim',
  'nvim-lua/plenary.nvim',
  telescope = 'nvim-telescope/telescope.nvim',
}

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')

  for name, path in pairs(plugs) do
    use(path)
    if type(name) == 'string' then
      local ok, _ = pcall(require, 'plug.'..name)
      if not ok then
        vim.notify('Faild to load plug `'..name..'`', vim.log.levels.ERROR)
      end
    end
  end

  if packer_bootstrap then
    require('packer').sync()
  end
end)
