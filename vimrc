" FULL VIM
set nocompatible

" Vundle
filetype off  " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" My Bundles here:
"
" original repos on github
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-fugitive'
Bundle 'clones/vim-l9'
Bundle 'clones/vim-fuzzyfinder'
Bundle 'scrooloose/syntastic.git'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/powerline'
Bundle 'flazz/vim-colorschemes'
Bundle 'mileszs/ack.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'editorconfig/editorconfig-vim'


filetype plugin indent on

" enable 256 color !!1!
set t_Co=256


" MAP LEADER
noremap , \
let mapleader = ","

" CONFIGURATION MAPPING
set scrolloff=3                     " show 3 lines of context around the cursor
set autoread                        " set to auto read when a file is changed from the outside
set mouse=a                         " allow for full mouse support
set autowrite
set showcmd                         " show typed commands

set wildmenu                        " turn on WiLd menu
set wildmode=list:longest,list:full " activate TAB auto-completion for file paths
set wildignore+=*.o,*.class,*.pyc,.git,.svn,node_modules

set ruler                           " always show current position
set backspace=indent,eol,start      " set backspace config, backspace as normal
set nomodeline                      " security
set encoding=utf8

set hlsearch                        " highlight search things
set incsearch                       " go to search results as typing
set smartcase                       " but case-sensitive if expression contains a capital letter.
set ignorecase                      " ignore case when searching
set gdefault                        " assume global when searching or substituting
set magic                           " set magic on, for regular expressions
set showmatch                       " show matching brackets when text indicator is over them

set lazyredraw                      " don't redraw screen during macros
set ttyfast                         " improves redrawing for newer computers
set fileformats=unix,mac,dos

set nobackup                        " prevent backups of files, since using versioning mostly and undofile
set nowritebackup
set noswapfile
set directory=~/.vim/.swp,/tmp      " swap directory
set shiftwidth=4                    " set tab width
set softtabstop=4
set tabstop=4
set smarttab
set expandtab
set autoindent                      " set automatic code indentation
set hidden

set wrap                            " wrap lines
set linebreak                       " this will not break whole words while wrap is enabled
set showbreak=…
set cursorline                      " highlight current line
set list listchars=tab:\ \ ,trail:· " show · for trailing space, \ \ for trailing tab
set spelllang=en,de                 " set spell check language
set noeb vb t_vb=                   " disable audio and visual bells
au GUIEnter * set vb t_vb=

syntax enable                       " enable syntax highlighting

" Statusline

if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\    " Filename
    set statusline+=%w%h%m%r " Options
    set statusline+=%{fugitive#statusline()} "  Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=\ [%{getcwd()}]          " current dir
    "set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

" Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" VIM 7.3 FEATURES

if v:version >= 703
    set undofile
    set undodir=$HOME/.vim/.undo
    set undolevels=1000
    set undoreload=10000
endif

" COLOR SCHEME
set background=dark
let g:solarized_contrast = "high"
colorscheme solarized

" FOLDING
set foldenable                   " enable folding
set foldmethod=marker            " detect triple-{ style fold markers
set foldlevel=99

" ADDITIONAL KEY MAPPINGS
" fast saving
nmap <leader>w :up<cr>
" fast escaping
imap jj <ESC>
" prevent accidental striking of F1 key
map <F1> <ESC>
imap <F1> <ESC>
" clear highlight
nnoremap <leader><space> :noh<cr>
" map Y to match C and D behavior
nnoremap Y y$
" yank entire file (global yank)
nmap gy ggVGy
" ignore lines when going up or down
nnoremap j gj
nnoremap k gk
" auto complete {} indent and position the cursor in the middle line
inoremap {<CR>  {<CR>}<Esc>O
inoremap (<CR>  (<CR>)<Esc>O
inoremap [<CR>  [<CR>]<Esc>O
" fast window switching
map <leader>, <C-W>w
" cycle between buffers
map <leader>. :b#<cr>
" change directory to current buffer
map <leader>cd :cd %:p:h<cr>
" swap implementations of ` and ' jump to prefer row and column jumping
nnoremap ' `
nnoremap ` '
" indent visual selected code without unselecting and going back to normal mode
vmap > >gv
vmap < <gv
" pull word under cursor into lhs of a substitute (for quick search and replace)
nmap <leader>r :%s#\<<C-r>=expand("<cword>")<CR>\>#
" strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//e<cr>:let @/=''<CR>
" insert path of current file into a command
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
" fast editing of the .vimrc
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>
" allow saving when you forgot sudo
cmap w!! w !sudo tee % >/dev/null
" turn on spell checking
map <leader>spl :setlocal spell!<cr>
" spell checking shortcuts
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" numbers
set number
set relativenumber
nnoremap <F3> :set nonumber!<CR>
nnoremap <F4> :set relativenumber!<CR>

"" ADDITIONAL AUTOCOMMANDS

" saving when focus lost (after tabbing away or switching buffers)
au FocusLost,BufLeave,WinLeave,TabLeave * silent! up
" open in last edit place
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif
au QuickFixCmdPost *grep* cwindow


"" ADDITIONAL GUI SETTINGS

if has("gui_running")
    set guioptions-=T
    " set guioptions-=m
    set linespace=6
    set columns=160 lines=26
    set guioptions-=T

    " crazy hack to get gvim to remove all scrollbars
    set guioptions+=LlRrb
    set guioptions-=LlRrb

    if has("mac")
        set guifont=DejaVu\ Sans\ Mono\:h14
    else
        set guifont=DejaVu\ Sans\ Mono\ 9
    endif
endif

"" PLUGIN SETTINGS

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>
let g:NERDChristmasTree=1
let g:NERDTreeDirArrows=1
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeShowHidden=1

" Super Tab
" let g:SuperTabDefaultCompletionType = "context"

" Unimpaired
" bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" MAIL HUMAN TEX
au BufNewFile,BufRead *.txt set filetype=human
au FileType human,mail,tex set expandtab textwidth=78 nocindent

"" LANGUAGE SPECIFIC

" CSS
au FileType css set expandtab tabstop=2 shiftwidth=2

" HTML
au FileType html,xhtml set formatoptions+=tl
au FileType html,xhtml set foldmethod=indent smartindent
au FileType html,xhtml set expandtab tabstop=3 shiftwidth=3
au FileType html,php,xhtml,jsp,ejs let b:delimitMate_matchpairs = "(:),[:],{:}"

" Python
au FileType python set noexpandtab

" JavaScript
au FileType javascript setlocal ts=4 sts=4 sw=4
au BufRead,BufNewFile *.json set ft=json
