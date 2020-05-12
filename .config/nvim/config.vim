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
set conceallevel=0 concealcursor=i
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

set statusline+=%f

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
" }}}
"
