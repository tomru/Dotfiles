" FULL VIM
set nocompatible

" Vundle

filetype off  " required!
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'L9'
Plugin 'unimpaired.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'

Plugin 'maxbrunsfeld/vim-yankstack', {'name': 'yankstack'}
Plugin 'surround.vim'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'editorconfig/editorconfig-vim'

Plugin 'sheerun/vim-polyglot'

Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

Plugin 'mileszs/ack.vim'

Plugin 'vim-airline', {'name': 'airline'}
Plugin 'altercation/vim-colors-solarized'

Plugin 'scrooloose/syntastic.git'
Plugin 'Townk/vim-autoclose'

Plugin 'pangloss/vim-javascript'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'gorodinskiy/vim-coloresque'

Plugin 'inside/vim-search-pulse'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Unleash all VIM power
set nocompatible

"" Fix backspace indent
set backspace=indent,eol,start

"" allow plugins by file type
filetype on
filetype plugin on
filetype indent on

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Encoding
set bomb
set ttyfast
set binary

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,mac,dos
set showcmd

"" Mouse
set mouse=a

"
" Visual Settings
"

if has("gui_running")
  "disable menu, toolsbar, scrollbar
  set guioptions -=m
  set guioptions -=T
  set guioptions -=r
endif

set ruler
set number

set t_Co=256
set cursorline

syntax enable
set background=dark
colorscheme solarized

set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

"" disable visual bell
set visualbell
set t_vb=

"" enable spelling
set spelllang=en,de

"" long lines
let &showbreak='↪ '

"
" KEY MAPPINGS
"

"" MAP LEADER
noremap , \
let mapleader = ","

"" fast saving
nmap <leader>w :update<cr>
"" fast escaping
imap jj <ESC>
"" prevent accidental striking of F1 key
map <F1> <ESC>
imap <F1> <ESC>
"" clear highlight
nnoremap <leader><space> :noh<cr>
"" map Y to match C and D behavior
nnoremap Y y$
"" yank entire file (global yank)
nmap gy ggVGy
"" ignore lines when going up or down
nnoremap j gj
nnoremap k gk

"" fast window switching
map <leader>, <C-W>w
"" cycle between buffers
map <leader>. :b#<cr>

"" change directory to current buffer
map <leader>cd :cd %:p:h<cr>
"" indent visual selected code without unselecting and going back to normal mode
vmap > >gv
vmap < <gv
"" Visually select the text that was last edited/pasted
nmap gV `[v`]

"" pull word under cursor into lhs of a substitute (for quick search and replace)
nmap <leader>r :%s#\<<C-r>=expand("<cword>")<CR>\>#

"" strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//e<cr>:let @/=''<CR>

"" insert path of current file into a command
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

"" fast editing of the .vimrc
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

"" allow saving when you forgot sudo
cmap w!! w !sudo tee % >/dev/null

"" turn on spell checking
map <leader>spl :setlocal spell!<cr>
"" spell checking shortcuts
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"" toggle states
nmap <silent> <leader>hh :set invhlsearch<CR>
nmap <silent> <leader>ll :set invlist<CR>
nmap <silent> <leader>pp :set invpaste<CR>

nmap <silent> <leader>nn :set invnumber<CR>
nmap <silent> <leader>ii :set invrelativenumber<CR>

if exists('+relativenumber')
  set relativenumber
endif

"
" Plugin Configuration
"

"" ariline
let g:airline_theme = 'solarized'
let g:airline_enable_syntastic = 1
let g:airline#extensions#tabline#enabled = 1

"" NERDTree configuration
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 20
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

"" Unimpaired
"" bubble single lines
nmap <leader>k [e
nmap <leader>j ]e
"" bubble multiple lines
vmap <leader>k [egv
vmap <leader>j ]egv

"" yankstack
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste


"
" Autocmd Rules
"

"" do syntax highlight syncing from start
autocmd BufEnter * :syntax sync fromstart

"" Remember cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

set autoread

"" txt, mail, human, tex
au BufNewFile,BufRead *.txt set filetype=human
au FileType human,mail,tex set wrap wm=2 textwidth=78 nocindent

"" Python
au FileType python set noexpandtab

"" Json
au BufRead,BufNewFile *.json set ft=json

"" Mustache
au BufRead,BufNewFile *.template set filetype=html syntax=mustache
