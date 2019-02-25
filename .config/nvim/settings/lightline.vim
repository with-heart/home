let g:lightline = {
      \ 'colorscheme': 'ayu',
      \ 'active': {
      \   'left': [
      \     ['mode', 'paste'],
      \     ['gitbranch', 'readonly', 'filename']
      \   ],
      \   'right': [
      \     ['lineinfo'],
      \     ['percent'],
      \     ['fileformat', 'filetype']
      \   ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'readonly': 'LightlineReadonly',
      \   'filename': 'LightlineFilename',
      \   'fileformat': 'LightlineFileformat',
      \   'filetype': 'LightlineFiletype',
      \ }
      \ }

function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

function! LightlineAbbreviatedDirectory()
  let base = expand('%:h') != '.' && expand('%:h') !=# '' ? expand('%:h') . '/' : ''

  if len(base) == 0 || winwidth(0) <= 70 || base[0] == '/'
    return base
  endif

  let dirs = split(base, '/')

  if len(dirs) == 1
    return base
  endif

  let parent = dirs[-1]
  let root = dirs[0:-2]
  let abbreviated = []

  for dir in root
    if dir != '.'
      call add(abbreviated, dir[0])
    endif
  endfor

  return join(abbreviated, '/') . '/' . parent . '/'
endfunction

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'

  if filename =~ "#FZF$"
    return "[FZF]"
  endif

  let directory = LightlineAbbreviatedDirectory()
  let modified = &modified ? ' +' : ''
  return directory . filename . modified
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction
