call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

Plug 'L9'
Plug 'unimpaired.vim'
Plug 'surround.vim'

Plug 'editorconfig/editorconfig-vim'

Plug 'Shougo/unite.vim'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'

Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }

Plug 'sjl/gundo.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdcommenter'

Plug 'sheerun/vim-polyglot'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'scrooloose/syntastic'

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'inside/vim-search-pulse'

Plug 'rking/ag.vim'

Plug 'christoomey/vim-tmux-navigator'
Plug 'itchyny/lightline.vim'
Plug 'chriskempson/base16-vim'

Plug 'Raimondi/delimitMate'

Plug 'marijnh/tern_for_vim', { 'do': 'npm install', 'for': 'javascript'}
Plug 'mustache/vim-mustache-handlebars'

Plug 'shime/vim-livedown'


call plug#end()

"" reload when vim config changes
autocmd! bufwritepost .vimrc source %

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set smartcase

"" Directories for swp files
set nobackup
set noswapfile

"" Mouse
set mouse=a

"" Visual settings
syntax enable
set cursorline

set number
if exists('+relativenumber')
  set relativenumber
endif

set background=dark
let base16colorspace=256
colorscheme base16-solarized

if has("gui_running")
  "disable menu, toolsbar, scrollbar
  set guioptions -=m
  set guioptions -=T
  set guioptions -=r
endif

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

" Spelling highlights. Use underline in term to prevent cursorline highlights
" from interfering
if !has("gui_running")
  hi clear SpellBad
  hi SpellBad cterm=underline ctermfg=red
  hi clear SpellCap
  hi SpellCap cterm=underline ctermfg=blue
  hi clear SpellLocal
  hi SpellLocal cterm=underline ctermfg=blue
  hi clear SpellRare
  hi SpellRare cterm=underline ctermfg=blue
endif

" Display unprintable chars
set listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣
set showbreak=↪

" Open all folds initially
set foldmethod=indent
set foldlevelstart=99

" Writes to the unnamed register also writes to the * and + registers. This
" makes it easy to interact with the system clipboard
if has ('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

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
"" clear highlight
nnoremap <leader><space> :noh<cr>
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

" <Leader>0: Run the visually selected code in node and replace it with the output
vnoremap <silent> <Leader>0 :!node<cr>

" +/-: Increment number
nnoremap + <c-a>
nnoremap - <c-x>

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

"" Make Ctrl-P plugin a lot faster for Git projects
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0

"" Indent Guides
nmap <leader>g :IndentGuidesToggle<CR>

"" Gundo
nmap <leader>u :GundoToggle<CR>

"" YouCompleteMe
let g:ycm_key_list_select_completion = ['<c-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<u-k>', '<Up>']
let g:SuperTabDefaultCompletionType = '<c-tab>'

"" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
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
