" Autoinstall dein.vim
if empty(glob('~/.cache/dein/repos/github.com/Shougo/dein.vim'))
  silent !curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
  silent !sh ./installer.sh ~/.cache/dein
  autocmd VimEnter * call dein#install()
endif

if &compatible
  set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein')
  call dein#add('neomake/neomake')

  " Appearance
  " =========
  call dein#add('ayu-theme/ayu-vim')
  call dein#add('haishanh/night-owl.vim')
  call dein#add('dracula/vim', {'as': 'dracula'})
  call dein#add('Yggdroot/indentLine')

  " Completion
  " ==========
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' })
  call dein#add('Shougo/neosnippet')

  " File Navigation
  " ===============
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

  " Text Navigation
  " ===============
  call dein#add('easymotion/vim-easymotion')

  " Text Manipulation
  " ===============
  call dein#add('tpope/vim-surround')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('godlygeek/tabular')
  call dein#add('alvan/vim-closetag')
  call dein#add('alx741/vim-hindent')

  " Text Objects
  " ============
  call dein#add('kana/vim-textobj-user')
  call dein#add('poetic/vim-textobj-javascript')

  " Languages
  " =========
  call dein#add('sheerun/vim-polyglot')
  call dein#add('jparise/vim-graphql')
  call dein#add('jxnblk/vim-mdx-js')
  call dein#add('hashivim/vim-terraform')
  call dein#add('juliosueiras/vim-terraform-completion')
  call dein#add('chr4/nginx.vim')
  call dein#add('jasonshell/vim-svg-indent')
  call dein#add('flowtype/vim-flow')
  call dein#add('mattn/emmet-vim', { 'for': ['html', 'css', 'javascript.jsx'] })
  call dein#add('ternjs/tern_for_vim', {'do': 'yarn install'})
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('styled-components/vim-styled-components')
  call dein#add('posva/vim-vue')

  " Git
  " ===
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')

  " Utility
  " =======
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-commentary')
  call dein#add('pbrisbin/vim-mkdir')
  call dein#add('w0rp/ale', { 'do': 'npm install -g prettier' })
  call dein#add('prettier/vim-prettier', {
        \ 'do': 'npm install -g prettier',
        \ 'rev': 'release/1.x' })

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable
