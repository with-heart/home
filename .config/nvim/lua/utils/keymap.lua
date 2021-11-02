local Keymap = {}

function Keymap.map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function Keymap.mapcmd(key, cmd, opts)
  local expanded_cmd = ':' .. cmd .. '<cr>'
  Keymap.map('n', key, expanded_cmd, opts)
end

return Keymap
