require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    tags = true;
    nvim_lsp = true;
    nvim_lua = true;
  };
}

local map = function(lhs, rhs)
  require('utils.keymap').map('i', lhs, rhs, {
    silent = true,
    expr = true,
  })
end

_G.tab_confirm = function()
  if vim.fn.pumvisible() == 1 then
    require 'nvim-autopairs'.autopairs_cr()
    return vim.fn['compe#confirm']()
  else
    return vim.api.nvim_replace_termcodes('<Tab>', true, true, true)
  end
end

vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_confirm()', {noremap = true, expr = true})
vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.tab_confirm()', {noremap = true, expr = true})

map('<C-Space>', 'compe#complete()')
map('<C-e>', [[compe#close('<C-e>')]])
map('<C-f>', [[compe#scroll({ 'delta': +4 })]])
map('<C-d>', [[compe#scroll({ 'delta': -4 })]])
