function! GitFileStatus()
  if !exists('b:gitgutter')
    return ''
  endif
  let l:summary = get(b:gitgutter, 'summary', [0, 0, 0])
  let l:result = l:summary[0] == 0 ? '' : ' +'.l:summary[0]
  let l:result .= l:summary[1] == 0 ? '' : ' ~'.l:summary[1]
  let l:result .= l:summary[2] == 0 ? '' : ' -'.l:summary[2]
  if l:result != ''
    return ' '.l:result
  endif
  return l:result
endfunction
