set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'The-NERD-Commenter'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'mru.vim'
Plugin 'ctrlpvim/ctrlp.vim'

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

call vundle#end() " required
filetype plugin indent on " required

syntax enable

set cursorline
set showcmd " show command in bottom bar
set mouse=a " set mouse on
set pastetoggle=<F2> " set auto-indenting for code paste
set autoread " set refresh
set wildmenu " show completion on the mode-line
set incsearch
set hlsearch "highlight search things
set linespace=0.
set encoding=utf-8
set smartcase
set ignorecase
set nobackup
set noswapfile
set nowritebackup
set number
set statusline+=%F " add full file path to your existing statusline
set showmatch " highlight matching [{()}]

" improve vim's scrolling speed
set ttyfast
set ttyscroll=3
set lazyredraw

" indentetion
set autoindent
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
filetype indent on " load filetype-specific indent files

vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>
imap <c-e> &amp;
abbr html5% <!doctype html><cr><html><cr><head><cr><title></title><cr></head><cr><body></body><cr></html>
abbr js% (function(doc, global) {<cr><cr>'use strict';<cr><cr>}(document, window));
abbr utf8py% # -*- coding: utf-8 -*-
abbr importpdb% import pdb; pdb.set_trace()

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
