call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/mru.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim', { 'commit': '4145f53f3d343c389ff974b1f1a68eeb39fba18b' }
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tomasiser/vim-code-dark'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'terryma/vim-multiple-cursors'
Plug 'janko/vim-test'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }
Plug 'norcalli/nvim-colorizer.lua'
Plug 'jparise/vim-graphql'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'pechorin/any-jump.vim'
Plug 'rafcamlet/nvim-luapad'
Plug 'nvim-lua/plenary.nvim'
Plug 'rhysd/vim-grammarous'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'fedepujol/move.nvim'
Plug 'github/copilot.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'windwp/nvim-ts-autotag'
Plug 'editorconfig/editorconfig-vim'
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}


call plug#end()

set termguicolors
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
set scrolloff=8 " show lines after the cursor
set formatexpr=CocAction('formatSelected') " format selected block of code
let mapleader = ' '

" change the direction of new splits
set splitbelow
set splitright

" load configs
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>|

" copy the whole file
nnoremap <leader>Y gg"+yG

" copy absolute path
nnoremap <leader>cp :let @*=expand("%:p")<CR>

" move lines up / down
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" fold
set foldmethod=indent
set foldnestmax=10
set foldcolumn=3
set foldlevel=20
"nmap F za

" highlight trailing whitespaces
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/

" create the 'tags' file
command! MakeTags !ctags -R .

" remove blank spaces
nmap <silent><Leader>s <Esc>:%s/\s\+$//g<CR>"

" replace tabs to spaces
nmap <Leader>ts <Esc>:%s/\t/  /g<CR>"

" indentetion
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartcase

filetype indent on " load filetype-specific indent files

" Automatic reload
augroup myvimrc
  au!
  au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" terminal
tnoremap <Esc> <C-\><C-n>
"nmap T :split \| terminal<CR>

" coc.nvim
let g:coc_global_extensions = [
    \ 'coc-markdownlint',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-tslint-plugin',
    \ 'coc-tsserver',
    \ 'coc-snippets',
    \ 'coc-prettier',
    \ 'coc-eslint',
    \ 'coc-react-refactor',
    \ 'coc-lua',
    \ 'coc-pyright',
    \ 'coc-markdownlint',
    \ 'coc-clangd',
    \ 'coc-java',
\ ]

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap FF :CocCommand eslint.executeAutofix<Enter>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader> qf <Plug>(coc-fix-current)
nmap <leader>rn <Plug>(coc-rename)

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" any-jump
nnoremap <leader>j :AnyJump<CR>
xnoremap <leader>j :AnyJumpVisual<CR>
nnoremap <leader>ab :AnyJumpBack<CR>
nnoremap <leader>al :AnyJumpLastResults<CR>

" to get correct comment highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

" autoimport functionality
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

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

" vim-import-cost
augroup import_cost_auto_run
  autocmd!
  autocmd InsertLeave *.js,*.jsx,*.ts,*.tsx ImportCost
  autocmd BufEnter *.js,*.jsx,*.ts,*.tsx ImportCost
  autocmd CursorHold *.js,*.jsx,*.ts,*.tsx ImportCost
augroup END

" nvim-colorizer
lua require'colorizer'.setup()

" coc
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" coc-react-refactor
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" any-jump
nnoremap <leader>j :AnyJump<CR>

" move.nvim
nnoremap <A-Up> :MoveLine(-1)<CR>
nnoremap <A-Down> :MoveLine(1)<CR>
vnoremap <A-Up> :MoveBlock(-1)<CR>
vnoremap <A-Down> :MoveBlock(1)<CR>

" Lightline
let g:lightline = {
      \ 'colorscheme': 'codedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

colorscheme codedark

" Copilot
imap <C-n> <Plug>(copilot-next)
imap <C-p> <Plug>(copilot-previous)

" nvim-treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "javascript",
      "typescript",
      "tsx",
      "json",
      "html",
      "css",
      "graphql",
      "python",
      "ruby",
      "fish",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
    refactor = {
      highlight_definitions = {
        enable = true,
        clear_cursor_mode = true,
      },
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "grr",
        },
      },
    },
    autotag = {
      enable = true,
    },
}
EOF

" nvim-tree
lua << EOF
require("nvim-tree").setup({})

local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
EOF

map <C-t> :NvimTreeToggle<CR>
map <C-f> :NvimTreeFindFile<CR>

" Terminal
let g:term_buf = 0
let g:term_win = 0

function! TermToggle(height)
  if win_gotoid(g:term_win)
    hide
  else
    botright new
    exec "resize " . a:height

    try
      exec "buffer " . g:term_buf
    catch
      call termopen($SHELL, {"detach": 0})
      let g:term_buf = bufnr("")
      set nonumber
      set norelativenumber
      set signcolumn=no
    endtry
    startinsert!
    let g:term_win = win_getid()
  endif
endfunction

" Toggle terminal on/off (neovim)
noremap zz :call TermToggle(12)<CR>
inoremap zz <Esc>:call TermToggle(12)<CR>
tnoremap zz <C-\><C-n>:call TermToggle(12)<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>
