set encoding=utf-8
scriptencoding utf-8

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

Plug 'L9'
Plug 'unimpaired.vim'
Plug 'surround.vim'
Plug 'Align'
Plug 'Raimondi/delimitMate'

Plug 'editorconfig/editorconfig-vim'

Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --tern-completer' }

Plug 'ludovicchabant/vim-gutentags'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'scrooloose/syntastic'

Plug 'tpope/vim-fugitive'
Plug 'rhysd/conflict-marker.vim'
Plug 'airblade/vim-gitgutter'

Plug 'inside/vim-search-pulse'

Plug 'itchyny/lightline.vim'

Plug 'chriskempson/base16-vim'

Plug 'pangloss/vim-javascript'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'mxw/vim-jsx'

Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

"" enable local .vimrc
set exrc   " Enable use of directory-specific .vimrc
set secure " Only run autocommands owned by me

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

"" find
set path+=**

"" Display all matching files when we tab complete
set wildmenu

"set wildignorecase
set wildignore+=.git,.hg,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.m4a,*.mp3,*.oga,*.ogg,*.wav,*.webm
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.swp,.lock,.DS_Store,._*

"" saving
set fileformats=unix,dos,mac
set fileformat=unix

"" backups

" Use backup files when writing (create new file, replace old one with new
" one)
set writebackup
" but do not leave around backup.xyz~ files after that
set nobackup
" backupcopy=yes is the default, just be explicit. We need this for
" webpack-dev-server and hot module reloading -- preserves special file types
" like symlinks
set backupcopy=yes nobackup

" swap files
set noswapfile

" persistent undo
set undodir=~/.vim/undos
set undofile
set undolevels=1000
set undoreload=10000

"" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"" Mouse
set mouse=a

"" Use modeline overrides
set modeline
set modelines=10

"" Visual settings
syntax enable
set synmaxcol=512

set title

set cursorline

set number
if exists('+relativenumber')
  set relativenumber
endif

set background=dark
let base16colorspace=256
colorscheme base16-solarized-dark

if has("gui_running")
  "disable menu, toolsbar, scrollbar
  set guioptions -=m
  set guioptions -=T
  set guioptions -=r
endif

" Display unprintable chars
set listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣,trail:·
set showbreak=↳

"" disable visual bell
set visualbell
set t_vb=

"" spelling
set spelllang=en,de

" Open all folds initially
set foldmethod=indent
set foldlevelstart=99

" Writes to the unnamed register also writes to the * and + registers. This
" makes it easy to interact with the system clipboard
set clipboard^=unnamed
if has ('unnamedplus')
  set clipboard^=unnamedplus
endif

" diff
set fillchars+=diff:⣿
set diffopt=vertical                  " Use in vertical diff mode
set diffopt+=filler                   " blank lines to keep sides aligned
set diffopt+=iwhite                   " Ignore whitespace changes


"
" KEY MAPPINGS
"

"" MAP LEADER
noremap , \
let mapleader = ","
set timeoutlen=200

"" fast saving
nmap <leader>w :update<cr>
"" fast escaping
imap jj <ESC>
"" clear highlight
nnoremap <leader><space> :noh<cr>
"" ignore lines when going up or down
nnoremap j gj
nnoremap k gk

"" open last buffer
nnoremap <BS> <C-^>

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

"" indent visual selected code without unselecting and going back to normal mode
vmap > >gv
vmap < <gv
"" Visually select the text that was last edited/pasted
nmap gV `[v`]

"" pull word under cursor into lhs of a substitute (for quick search and replace)
nmap <leader>r :%s#\<<C-r>=expand("<cword>")<CR>\>#

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

"" <Leader>0: Run the visually selected code in node and replace it with the output
vnoremap <silent> <Leader>0 :!node<cr>

" debugging, use leader-DD to start, do a slow action, then leader-DQ to
" finish. Your output will be in profile.log
nnoremap <silent> <leader>DD :exe ":profile start profile.log"<cr>:exe ":profile func *"<cr>:exe ":profile file *"<cr>
nnoremap <silent> <leader>DQ :exe ":profile pause"<cr>:noautocmd qall!<cr>

"" abbreviations
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

iab xnow <c-r>=strftime("%Y-%m-%d %H:%M")<cr>

"
" Plugin Configuration
"

"" gutentags
let g:gutentags_file_list_command = {
    \ 'markers': {
        \ '.git': 'git ls-files',
        \ '.hg': 'hg files',
        \ },
    \ }

"" fzf 
nmap <leader>b :Buffers<cr>
nmap <leader>f :GFiles<cr>
nmap <leader>F :Files<cr>
nmap <leader>a :Ag<space>
vmap <leader>a y:Ag <c-r>" <cr>
nmap <leader>A :Ag <c-r><c-w><cr>
nmap <leader>c :Commits<cr>

"" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" local linter support
let g:syntastic_javascript_checkers = []

function! CheckJavaScriptLinter(filepath, linter)
	if exists('b:syntastic_checkers')
		return
	endif
	if filereadable(a:filepath)
		let b:syntastic_checkers = [a:linter]
		let {'b:syntastic_' . a:linter . '_exec'} = a:filepath
	endif
endfunction

function! SetupJavaScriptLinter()
	let l:current_folder = expand('%:p:h')
	let l:bin_folder = fnamemodify(syntastic#util#findFileInParent('package.json', l:current_folder), ':h')
	let l:bin_folder = l:bin_folder . '/node_modules/.bin/'
	call CheckJavaScriptLinter(l:bin_folder . 'standard', 'standard')
	call CheckJavaScriptLinter(l:bin_folder . 'eslint', 'eslint')
endfunction

autocmd FileType javascript call SetupJavaScriptLinter()

"" lightline
if filereadable(expand("~/.vim/lightline.vim"))
    source ~/.vim/lightline.vim
endif

"" NERDTree configuration
nmap <leader>n :NERDTreeToggle<CR>

"" Unimpaired
"" bubble single lines
nmap <leader>k [e
nmap <leader>j ]e
"" bubble multiple lines
vmap <leader>k [egv
vmap <leader>j ]egv

"" Indent Guides
nmap <leader>g :IndentGuidesToggle<CR>

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
let g:livepreview_previewer = 'zathura'

" markdown
let g:markdown_fenced_languages = [
      \ 'html',
      \ 'javascript', 'js=javascript', 'json=javascript'
      \ ]

"
" Autocmd Rules
"

"" do syntax highlight syncing from start
autocmd BufEnter * :syntax sync fromstart

"" Remember cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

"" txt, mail, tex
au FileType text,markdown,mail,tex set wrap wm=2 textwidth=78 nocindent spell

"" Python
au FileType python set noexpandtab

"" JavaScript
au FileType javascript map <leader>r <esc>:TernRename<CR>

"" Json
au BufRead,BufNewFile *.json set ft=json

"" Mustache
au BufRead,BufNewFile *.template set filetype=html.mustache syntax=mustache

"" always open help in vertical split
au FileType help wincmd L
