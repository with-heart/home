function! AleStatusline(type)
  let count = ale#statusline#Count(bufnr(''))
  if a:type == 'error' && count['error']
    return printf(' %d E ', count['error'])
  endif

  if a:type == 'warning' && count['warning']
    let l:space = count['error'] ? ' ': ''
    return printf('%s %d W ', l:space, count['warning'])
  endif

  return ''
endfunction

let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'yaml': ['prettier']}
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'

autocmd FileType javascript let g:ale_linters = findfile('.eslintrc', '.;') != '' || findfile('eslint.config.js', '.;') != '' ? {'javascript': ['eslint']} : {'javascript': ['']}
