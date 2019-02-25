let vimsettings = '~/.config/nvim/settings'

for fpath in split(globpath(vimsettings, '*.vim'), '\n')
  exe 'source' fpath
endfor
