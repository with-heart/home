require('nvim-autopairs').setup {
  disable_filetype = { "TelescopePrompt" },
}

require('nvim-autopairs.completion.compe').setup {
  map_cr = true,
  map_complete = true,
  auto_select = true,
}
