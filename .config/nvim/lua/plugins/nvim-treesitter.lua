require('nvim-treesitter.configs').setup {
  ensure_installed = 'maintained',
  highlight = { enable = true },
  indent = { enable = true },
  autopairs = { enable = true },
  keymaps = {
    init_selection = 'gnn',
    node_incremental = 'grc',
    scope_incremental = 'grc',
    node_decremental = 'grm',
  },
}

require('nvim-treesitter.parsers').get_parser_configs().solidity = {
  install_info = {
    url = "https://github.com/JoranHonig/tree-sitter-solidity",
    files = { "src/parser.c" },
    requires_generate_from_grammar = true,
  },
  filetype = 'solidity'
}
