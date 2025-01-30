require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '/', right = '/'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 64,
      tabline = 64,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {'"󰄄 Aperture Laboratory"'},
    lualine_b = {'os.date("%a ")..(tonumber(os.date("%Y")) - 70)..os.date(".%m.%d")', 'os.date("%X")'},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'"󰣇 "'}
  },
  winbar = {},
  inactive_winbar = {},
  extensions = { 'nvim-tree' },
}
