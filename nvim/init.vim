call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/mru.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mxw/vim-jsx'
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'terryma/vim-multiple-cursors'
Plug 'janko/vim-test'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
call plug#end()

let g:gruvbox_contrast_dark='hard'
color gruvbox

set cursorline
set showcmd " show command in bottom bar
set mouse=a " set mouse on
set pastetoggle=<F2> " set auto-indenting for code paste
set wildmenu " show completion on the mode-line
set incsearch
set hlsearch " highlight search things
set encoding=utf-8
set smartcase " if the search string has an upper case letter in it, the search will be case sensitive
set ignorecase " ignore case when searching
set nobackup
set noswapfile
set nowritebackup
set number
set statusline+=%F " add full file path to your existing statusline
set showmatch " highlight matching [{()}]
set lcs=tab:▸\ ,trail:· " show 'invisible' characters
set clipboard+=unnamedplus
set title
set autoread " automatically re-read file if a change was detected
set nowrap " don't wrap long lines by default
set list " show tabs

" highlight trailing whitespaces
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/

" create the 'tags' file
command! MakeTags !ctags -R .

" remove blank spaces
nmap <silent><Leader>s <Esc>:%s/\s\+$//g<CR>"

" indentetion
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

filetype indent on " load filetype-specific indent files

" coc.nvim
let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-tslint-plugin',
    \ 'coc-tsserver',
    \ 'coc-snippets',
    \ 'coc-prettier',
    \ 'coc-eslint',
\ ]

nnoremap FF :CocCommand eslint.executeAutofix<Enter>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>qf <Plug>(coc-fix-current)

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" NERDTree
let NERDTreeShowHidden=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('json', 'LightYellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('js', 'Yellow', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('jsx', 'Yellow', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('ts', 'Green', 'none', 'Green', '#151515')
call NERDTreeHighlightFile('tsx', 'Green', 'none', 'Green', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('rb', 'Red', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('py', 'Blue', 'none', '#ff00ff', '#151515')

" Ack
let g:ackprg = 'ag --vimgrep'
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" FZF
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"

" vim-test
nmap <silent> t<C-n> :TestNearest<CR> " t Ctrl+n
nmap <silent> t<C-f> :TestFile<CR>    " t Ctrl+f
nmap <silent> t<C-s> :TestSuite<CR>   " t Ctrl+s
nmap <silent> t<C-l> :TestLast<CR>    " t Ctrl+l
nmap <silent> t<C-g> :TestVisit<CR>   " t Ctrl+g
