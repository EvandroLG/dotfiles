""
"" Janus setup
""

" Define paths
let g:janus_path = escape(fnamemodify(resolve(expand("<sfile>:p")), ":h"), ' ')
let g:janus_vim_path = escape(fnamemodify(resolve(expand("<sfile>:p" . "vim")), ":h"), ' ')
let g:janus_custom_path = expand("~/.janus")

" Source janus's core
exe 'source ' . g:janus_vim_path . '/core/before/plugin/janus.vim'

" You should note that groups will be processed by Pathogen in reverse
" order they were added.
call janus#add_group("tools")
call janus#add_group("langs")
call janus#add_group("colors")

""
"" Customisations
""

if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif


" Disable plugins prior to loading pathogen
exe 'source ' . g:janus_vim_path . '/core/plugins.vim'

""
"" Pathogen setup
""

" Load all groups, custom dir, and janus core
call janus#load_pathogen()

" Load plugin
execute pathogen#infect()
syntax on
filetype plugin indent on

" Load NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1

" Set auto-indenting for code paste
set pastetoggle=<F2>

" Set refresh
 set autoread
 
 " It's just a handy trick to automatically load the .vimrc file when I save it
 au BufWritePost .vimrc so $MYVIMRC
 
 " Set mouse on
 set mouse=a
 
 " Improve vim's scrolling speed
 set ttyfast
 set ttyscroll=3
 set lazyredraw
 
 set wildmenu " show completion on the mode-line
 set linespace=0.

" .vimrc.after is loaded after the plugins have loaded
