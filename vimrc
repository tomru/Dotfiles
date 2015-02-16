" NeoBundle
if !1 | finish | endif

if has('vim_starting')
  set nocompatible               " Be iMproved

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" my bundles
NeoBundle 'L9'
NeoBundle 'unimpaired.vim'

NeoBundle 'Shougo/unite.vim'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kien/ctrlp.vim'

NeoBundle 'scrooloose/nerdcommenter'

NeoBundle 'surround.vim'

NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'

NeoBundle 'sjl/gundo.vim'

NeoBundle 'editorconfig/editorconfig-vim'

NeoBundle 'sheerun/vim-polyglot'

NeoBundle 'nathanaelkane/vim-indent-guides'

NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'

NeoBundle 'rking/ag.vim'

NeoBundle 'christoomey/vim-tmux-navigator'

NeoBundle 'itchyny/lightline.vim'
NeoBundle 'chriskempson/base16-vim'

NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'Raimondi/delimitMate'

NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'JavaScript-Indent'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'marijnh/tern_for_vim'

NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'gorodinskiy/vim-coloresque'

NeoBundle 'inside/vim-search-pulse'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" other stuff

"" reload when vim config changes
autocmd! bufwritepost .vimrc source %

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Unleash all VIM power
set nocompatible

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
let base16colorspace=256
colorscheme base16-solarized

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
set showbreak=~

"
" KEY MAPPINGS
"

"" MAP LEADER
noremap , \
let mapleader = ","
"let mapleader = "\<Space>"

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

" Easier split navigation

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"" fast window switching
map <leader>, <C-W>w

"" open next buffer
map <leader>. :bn<cr>

"" cycle between buffers
map <leader>: :b#<cr>

"" delete buffer
map <leader>bd :bd<cr>

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

"" syntastic
let g:syntastic_javascript_checkers = ['jshint','jscs']
let g:syntastic_check_on_open = 1

"" lightline
let g:lightline = {
\  'colorscheme': 'solarized',
\  'active': {
\    'left': [ [ 'mode', 'paste' ],
\              [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
\  },
\  'component': {
\    'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
\  },
\  'component_visible_condition': {
\    'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
\  }
\}

"" NERDTree configuration
nmap <leader>n :NERDTreeToggle<CR>

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

"" Make Ctrl-P plugin a lot faster for Git projects
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0

"" Indent Guides
nmap <leader>g :IndentGuidesToggle<CR>

"" Gundo
nmap <leader>u :GundoToggle<CR>

"" Ultisnips
"let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Tex
let g:tex_flavor = "latex"

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
au FileType human,mail,tex set wrap wm=2 textwidth=78 nocindent spell

"" Markdown
au FileType markdown set spell

"" Python
au FileType python set noexpandtab

"" Json
au BufRead,BufNewFile *.json set ft=json

"" Mustache
au BufRead,BufNewFile *.template set filetype=html syntax=mustache
