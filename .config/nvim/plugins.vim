let plug_install = 0
let autoload_plug_path = stdpath('config') . '/autoload/plug.vim'
if !filereadable(autoload_plug_path)
    silent exe '!curl -fL --create-dirs -o ' . autoload_plug_path .
        \ ' https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    execute 'source ' . fnameescape(autoload_plug_path)
    let plug_install = 1
endif
unlet autoload_plug_path

call plug#begin('~/.config/nvim/plugins')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Themes
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline-themes'

" Quality of Life Plugins
if !exists('g:vscode')
  Plug 'alvan/vim-closetag'
endif
Plug 'christoomey/vim-tmux-navigator'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'

" Language support
Plug 'sheerun/vim-polyglot'
Plug 'jparise/vim-graphql'
Plug 'jxnblk/vim-mdx-js'

call plug#end()

if plug_install
    PlugInstall --sync
endif
unlet plug_install

filetype plugin indent on
syntax enable

let g:airline_theme='ayu_mirage'
