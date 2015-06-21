set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'The-NERD-Commenter'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'

call vundle#end() " required
filetype plugin indent on " required

syntax enable

set cursorline
set mouse=a " set mouse on
set pastetoggle=<F2> " set auto-indenting for code paste
set autoread " set refresh
set paste
set wildmenu " show completion on the mode-line
set hlsearch "highlight search things
set linespace=0.
set encoding=utf-8
set smartcase
set ignorecase
set nobackup
set noswapfile
set nowritebackup
set number
set expandtab

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=4 sts=4 sw=2
autocmd Filetype javascript setlocal ts=8 sts=4 sw=2
autocmd Filetype python setlocal ts=8 sts=4 sw=4
autocmd Filetype lua setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

" It's just a handy trick to automatically load the .vimrc file when I save it
"au BufWritePost .vimrc so $MYVIMRC

" Add full file path to your existing statusline
set statusline+=%F

" Improve vim's scrolling speed
set ttyfast
set ttyscroll=3
set lazyredraw

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
