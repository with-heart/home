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
