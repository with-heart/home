if require "first_load"() then
  return
end

-- Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

if vim.g.vscode then
  require 'vscode'
else
  require 'settings'
  require 'keybindings'
  require 'plugins'
  require 'autocmds'
end

