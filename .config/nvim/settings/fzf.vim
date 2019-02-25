command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

nnoremap \ :Find<SPACE>

set grepprg=rg\ --vimgrep

let g:fzf_nvim_statusline = 0
