" 'e' command pre-populated to current file's location
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>ve :vsplit <C-R>=expand("%:p:h") . "/" <CR>

" Comment map
nmap <Leader>c gcc
xmap <Leader>c gc

" Yank to the end of the line
nnoremap Y yy

" Copy to system clipboard
vnoremap <C-c> "+y
" Paste from sytem clipboard with C-v
inoremap <C-v> <Esc>"+p
nnoremap <Leader>p "0p
nnoremap <Leader>p "0p
nnoremap <Leader>h viw"0p

" Move to end of yanked text after yank and paste
vnoremap y y`]
vnoremap p p`]

" Move selected lines up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Toggle between last 2 buffers
nnoremap <leader><tab> <c-^>

" Indenting in visual mode
xnoremap <s-tab> <gv
xnoremap <tab> >gv

" Plugin mappings {{{
  " NERDTree
  nnoremap <Leader>hf :NERDTreeFind<CR>
  nnoremap <Leader>n :NERDTreeToggle<CR>

  " fzf
  nnoremap <C-p> :Files<CR>
  nnoremap <Leader>b :Buffers<CR>
  nnoremap <Leader>t :BTags<CR>
  nnoremap <Leader>m :History<CR>

  " deoplete
  imap <expr><TAB>
        \ pumvisible() ? "\<C-n>" :
        \ neosnippet#expandable_or_jumpable() ?
        \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  imap <expr><silent><CR> pumvisible() ?
        \ deoplete#close_popup() . "\<Plug>(neosnippet_expand_or_jump)" :
        \ "\<CR>\<Plug>AutoPairsReturn"
  smap <silent><CR> <Plug>(neosnippet_expand_or_jump)
  " }}}
