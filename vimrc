"""
" Vundle
"""
set nocompatible
filetype off  " required!

set rtp+=~/.vim/vundle.git/ 
call vundle#rc()

" Github plugins
Bundle 'tpope/vim-fugitive'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-git'
Bundle 'ervandew/supertab'
Bundle 'sontek/minibufexpl.vim'
Bundle 'wincent/Command-T'
Bundle 'kevinw/pyflakes-vim'
Bundle 'mileszs/ack.vim'
Bundle 'sjl/gundo.vim'
Bundle 'fs111/pydoc.vim'
Bundle 'vim-scripts/pep8'
Bundle 'alfredodeza/pytest.vim'
Bundle 'reinh/vim-makegreen'
Bundle 'vim-scripts/TaskList.vim'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'sontek/rope-vim'
Bundle 'edsono/vim-matchit'
"Bundle 'vim-scripts/taglist.vim'
Bundle 'majutsushi/tagbar'
"Bundle 'ervandew/python.vim--Vasiliev'

"Bundle 'vim-scripts/javacomplete'
Bundle 'cespare/vjde'

" vim scripts plugins
Bundle 'SearchComplete'
Bundle 'bufkill.vim'
Bundle 'json.vim'

" Taking this from: http://www.vi-improved.org/vimrc.php

"""
" General
"""
filetype plugin indent on " detect filetype
set history=1000 " How many lines of history to remember
set columns=80
set ffs=mac,unix,dos " support all three, in this order
"set ofu=syntaxcomplete#Complete " Omnicomplete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

"autoclose preview window
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif 
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" source $MYVIMRC reloads the saved $MYVIMRC
:nmap <Leader>s :source $MYVIMRC<CR>
nmap <leader>a <Esc>:Ack!
" Hide titlebar in MacVim
set go-=T 



"""
" mini buff explorer
"""
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

"""
" NERDTree
"""
let NERDTreeIgnore=['\.pyc$']
map <leader>n :NERDTreeToggle<CR>


"""
" Tags List
"""
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

"""
" Custom Editing Commands
"""
nnoremap <C-i> :exec "normal i".nr2char(getchar())."\e"<CR>
nnoremap <C-a> :exec "normal a".nr2char(getchar())."\e"<CR>


"""
" Theme/Colors
"""
"set background=dark
syntax on " syntax highlighting on
colorscheme blackboard " my theme

" Tells you what the highlighting group under the cursor is
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR> 

"""
" Files/Backups
"""
"set backup " make backup file
"set backupdir=$VIM\vimfiles\backup " where to put backup file
set directory=~/.tmp " directory is the directory for temp file
set makeef=error.err " When using make, where should it dump the file

"""
" Vim UI
"""
set relativenumber " line numbers
set mouse=a " use mouse everywhere
set noerrorbells

"""
" Visual Cues
"""
set showmatch " show matching brackets
set cc=80
set cursorline
set cursorcolumn

"""
" Folding
"""
set foldmethod=indent
set foldlevel=99
nnoremap <C-Enter> za
vnoremap <C-Enter> zf

"""
" Indenting
"""
set ai " autoindent
set si " smartindent
set sw=4 sts=4 ts=4 et "default indenting
"autocmd FileType html setlocal sw=2 ts=2
"autocmd FileType javascript setlocal sw=2 ts=2
filetype plugin indent on

"""
" Useful bindings
"""
map <S-Enter> O<Esc>
map <CR> o<Esc>

"""
" New Line Format
"""
set fileformats=unix,mac,dos

"""
" Swap File
"""
set dir=~/.tmp

"""
" Status Line
"""
set statusline=%F%m%r%h%w\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

"""
" Python
"""
let g:pyflakes_use_quickfix = 0
let g:pep8_map='<leader>8'
au FileType python set omnifunc=pythoncomplete#Complete
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF


"""
" LaTeX
"""
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

"""
" JSON
"""
au! BufRead,BufNewFile *.json set filetype=json foldmethod=syntax 

"""
" Tasklist
"""
map <leader>td <Plug>TaskList

"""
" Undo Navigation
"""
map <leader>g :GundoToggle<CR>
