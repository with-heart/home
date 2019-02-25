let g:prettier#exec_cmd_async = 1

let g:prettier#autoformat = 0

let g:prettier#quickfix_auto_focus = 0

let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'false'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#trailing_comma = 'all'
let g:prettier#config#config_precedence = 'prefer-file'

autocmd BufWritePre *.js,*.jsx,*.yml,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.mdx,*.vue PrettierAsync
