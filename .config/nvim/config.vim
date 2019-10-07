let mapleader = "\<Space>"

let g:python_host_prog = expand('$PYENV_ROOT/versions/neovim2/bin/python')
let g:python3_host_prog = expand('$PYENV_ROOT/versions/neovim3/bin/python')

" General Settings {{{
" ================
set title
set number
set history=500
set showcmd
set noshowmode
set gdefault
set gcr=a:blinkon500-blinkwait500-blinkoff500
set cursorline
set smartcase
set ignorecase
set showmatch
set nostartofline
set timeoutlen=1000 ttimeoutlen=0
set fileencoding=utf-8
set wrap
set linebreak
set listchars=tab:\ \ ,trail:·
set list
set lazyredraw
set hidden
set conceallevel=2 concealcursor=i
set splitright
set splitbelow
set path+=**
set inccommand=nosplit
set fillchars+=vert:\|
set pumheight=30
set exrc
set secure
set grepprg=rg\ --vimgrep
set tagcase=smart
set updatetime=500
set synmaxcol=300

" No swap files
set noswapfile
set nobackup
set nowb

" Persistent undo
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

" Indentation
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smartindent
set nofoldenable
set colorcolumn=80

" Auto commands
augroup vimrc
	autocmd!
augroup END

autocmd vimrc BufWritePre * call StripTrailingWhitespaces()
autocmd vimrc InsertEnter * set nocul
autocmd vimrc InsertLeave * set cul
autocmd vimrc FocusGained,BufEnter * checktime

" Completion
set wildmode=list:full
set wildignore=*.o,*.obj,*~
set wildignore+=*.git*
set wildignore+=*.meteor*
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*cache*
set wildignore+=*logs*
set wildignore+=*node_modules/**
set wildignore+=*DS_Store*
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" Scrolling
set scrolloff=8
set sidescrolloff=15
set sidescroll=5

" Statusline
hi User1 guifg=#FF0000 guibg=#504945 gui=bold
hi User2 guifg=#FFFFFF guibg=#FF1111 gui=bold
hi User3 guifg=#2C323C guibg=#E5C07B gui=bold
set statusline=\ %{toupper(mode())}                                             "Mode
set statusline+=\ \│\ %{fugitive#head()}                                        "Git branch
set statusline+=%{GitFileStatus()}                                              "Git file status
set statusline+=\ \│\ %4F                                                       "File path
set statusline+=\ %1*%m%*                                                       "Modified indicator
set statusline+=\ %w                                                            "Preview indicator
set statusline+=\ %r                                                            "Read only indicator
set statusline+=\ %q                                                            "Quickfix list indicator
set statusline+=\ %=                                                            "Start right side layout
set statusline+=\ \│\ %y                                                        "Filetype
set statusline+=\ \│\ %p%%                                                      "Percentage
set statusline+=\ \│\ %c                                                        "Column number
set statusline+=\ \│\ %l/%L                                                     "Current line number/Total line numbers
set statusline+=\ %2*%{AleStatusline('error')}%*                                "Errors count
set statusline+=%3*%{AleStatusline('warning')}%*                                "Warning count

" Abbreviations
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
" }}}

" Functions
" {{{
function! StripTrailingWhitespaces()
  if &modifiable
    let l:l = line(".")
    let l:c = col(".")
    %s/\s\+$//e
    call cursor(l:l, l:c)
  endif
endfunction

function! CloseBuffer() abort
  if &buftype ==? 'quickfix'
    lclose
    return 1
  endif
  let l:nerdtreeOpen = g:NERDTree.IsOpen()
  let l:windowCount = winnr('$')
  let l:command = 'bd'
  let l:totalBuffers = len(getbufinfo({ 'buflisted': 1 }))
  let l:isNerdtreeLast = l:nerdtreeOpen && l:windowCount ==? 2
  let l:noSplits = !l:nerdtreeOpen && l:windowCount ==? 1
  if l:totalBuffers > 1 && (l:isNerdtreeLast || l:noSplits)
    let l:command = 'bp|bd#'
  endif
  silent exe l:command
endfunction
" }}}
"
