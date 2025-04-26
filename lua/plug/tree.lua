require("nvim-tree").setup({
  view = { width = 30 },
  git = { ignore = false },
  renderer = { icons = { glyphs = { git = { ignored = '󱃆' } } } },
})
