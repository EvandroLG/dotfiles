call plug#begin('~/.local/share/nvim/plugged')
Plug 'gmarik/Vundle.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/mru.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'w0rp/ale'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'mxw/vim-jsx'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

let g:gruvbox_contrast_dark='hard'
color gruvbox
set cursorline
set showcmd " show command in bottom bar
set mouse=a " set mouse on
set pastetoggle=<F2> " set auto-indenting for code paste
set autoread " set refresh
set wildmenu " show completion on the mode-line
set incsearch
set hlsearch "highlight search things
set encoding=utf-8
set smartcase
set ignorecase
set nobackup
set noswapfile
set nowritebackup
set number
set statusline+=%F " add full file path to your existing statusline
set showmatch " highlight matching [{()}]
set lcs=tab:▸\ ,trail:· " show 'invisible' characters
set clipboard+=unnamedplus

" highlight trailing whitespaces
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/

" create the 'tags' file
command! MakeTags !ctags -R .

" remove blank spaces
nmap <silent><Leader>s <Esc>:%s/\s\+$//g<CR>"

" indentetion
set autoindent
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set softtabstop=2 sw=2 ts=2

filetype indent on " load filetype-specific indent files

" copy/paste
vmap <C-x> :!pbcopy<CR>
nmap <C-a> ggVG:w !pbcopy<CR><CR>
vmap <C-c> :w !pbcopy<CR><CR>

" python abbreviations
abbr utf8py% # -*- coding: utf-8 -*-
abbr importpdb% import pdb; pdb.set_trace()

" front-end abbreviations
imap <c-e> &amp;
nnoremap %html :-1read $HOME/.vim/snippets/.html5.html<CR>
nnoremap %js_w :-1read $HOME/.vim/snippets/.js_wrapper.js<CR>
nnoremap %c :-1read $HOME/.vim/snippets/.c.c<CR>

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_working_path_mode = 'c'

" ALE
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
let g:ale_fix_on_save = 1
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

let g:ale_linters = {
    \ 'javascript': ['eslint'],
\}

let b:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'javascript': ['prettier','remove_trailing_lines', 'trim_whitespace']
\}

highlight link ALEWarningSign String
highlight link ALEErrorSign Title

" Ack
let g:ackprg = 'ag --vimgrep'
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
