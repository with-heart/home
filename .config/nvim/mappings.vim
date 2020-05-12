" 'e' command pre-populated to current file's location
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <Leader>ve :vsplit <C-R>=expand("%:p:h") . "/" <CR>

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

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

" make Y consistent with C and D
nnoremap Y y$
function! YRRunAfterMaps()
  nnoremap Y :<C-U>YRYankCount 'y$'<CR>
endfunction

" make 0 go to first character rather than beginning of the line
nnoremap 0 ^
nnoremap ^ 0

" ," Surround a word with "quotes"
map ," ysiw"
vmap ," c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>

" ,` Surround a word with `accent`
map ,` ysiw`
vmap ,` c`<C-R>"`<ESC>

" Go to last edit location with ,.
nnoremap ,. '.

" ,q to toggle quickfix window
nmap <silent> ,qc :cclose<CR>

" Zoom in
map <silent> ,gz <C-w>o

" Clear current search highlight by double-tapping //
nmap <silent> // :nohlsearch<CR>

" Type ,hl to toggle highlighting on/off and show current value
noremap ,hl :set hlsearch! hlsearch?<CR>

" Plugin mappings {{{
  " fzf
  nnoremap <C-p> :Files<CR>
  nnoremap <Leader>b :Buffers<CR>
  nnoremap <Leader>t :BTags<CR>
  nnoremap <Leader>m :History<CR>
" }}}
