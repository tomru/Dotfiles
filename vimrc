" vim:      set fenc=utf-8 nu et sts=4 sw=4 ft=vim fdm=marker fmr={{{,}}}:
" file:     ~/.vimrc
" author: Thomas Ruoff (with the help of a myriad others)

scriptencoding utf-8

" Plugins {{{
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

Plug 'sheerun/vim-polyglot'

call plug#end()
" }}}

" Basics {{{
set encoding=utf-8
set nocompatible                " choose no compatibility with legacy vi
filetype plugin indent on       " Load filetype plugin/indent files.
syntax on                       " Enable syntax highlighting.
set hidden
set ttyfast
set synmaxcol=512               " Limit syntax highlighting to 512 characters per line
set modeline                    " Use file-specific settings, if available.
set nobackup                      " Make backup files.
set noswapfile
set mouse=a                     " Mouse support everywhere.
set mousehide                   " Auto-hide cursor while typing.
set wildmode=list:longest,full  " Make completion more like zsh.
set wildmenu                    " Turn on command-line completion wild style.
set wildignore+=*.swp,*.bak,*.jpg,*.gif,*.png,*.git,
set ignorecase                  " Ignore case, except...
set smartcase                   " ...when search string contains uppercase.
set incsearch                   " Highlight as you type search phrase.
set hlsearch
set number                      " Show line numbers.
set report=0                    " Tell me when anything is changed via :...
set ruler                       " Show current positions along bottom.
set scrolloff=5                 " Keep 5 lines (top/bottom) for scope.
set showcmd                     " Show command being typed.
set showmatch                   " Show matching brackets.
set spell                       " Highlight misspelled words.
set spellcapcheck=              " Don't highlight uncapitalized first word.
set complete+=kspell            " Use <C-n> and <C-p> to get suggested spelling completions.
set splitright                  " Split to the right when executing :vsplit.
let g:netrw_liststyle=3         " Use tree style directory listing.
set background=dark
set path+=**

set clipboard^=unnamedplus

" }}}

" Local .vimrc {{{
set exrc   " Enable use of directory-specific .vimrc
set secure " Only run autocommands owned by me
" }}}

" Text Formatting {{{
set list                        " Show real tabs (so they can be removed).
set listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣,trail:-
set linebreak                   " Don't soft-wrap in the middle of a word.
set showbreak=↳                 " Show `…' at the beginning of a soft-broken line.
set tabstop=4                   " Real tabs are 4 columns long.
set expandtab                   " No real tabs (use spaces for tabs).
set softtabstop=4               " Set # of spaces when hitting tab/delete.
set shiftwidth=4                " Set # of softtabs when using cindent, <<, >>, ...
set textwidth=80                " Set max # of characters on each line.
set autoindent                  " Use indentation level of previous line.
set nojoinspaces                " Don't add extra space after ., !, etc. when joining.
set formatoptions+=j            " Delete comment character when joining commented lines.
" }}}

" Folding {{{
set foldmethod=indent
set foldlevelstart=3
" }}}

" Diff settings {{{
set fillchars+=diff:⣿
set diffopt=vertical                  " Use in vertical diff mode
set diffopt+=filler                   " blank lines to keep sides aligned
set diffopt+=iwhite                   " Ignore whitespace changes
" }}}

" {{{ Undo
set undodir=~/.vim/undos
set undofile
set undolevels=1000
set undoreload=10000
" }}}

" Visual Setting {{{
set cursorline
let base16colorspace=256
colorscheme base16-solarized-dark

set number
if exists('+relativenumber')
  set relativenumber
endif
" }}}

" GUI Settings {{{
if has("gui_running")
  "disable menu, toolsbar, scrollbar
  set guioptions -=m
  set guioptions -=T
  set guioptions -=r
endif
" }}}

" Key mappings {{{

let mapleader=','
let maplocalleader=','
set timeoutlen=400

"" fast escaping
inoremap jj <ESC>

"" fast editing
nnoremap <leader>e :e<space>

"" fast saving
nnoremap <leader>w :update<cr>

"" clear highlight
nnoremap <leader><space> :noh<cr>

"" fast window switching
noremap <leader>, <C-W>w

"" open next,prev buffer, cycle
noremap <leader>. :bn<cr>
noremap <leader>m :bp<cr>
noremap <leader>: :b#<cr>

"" delete buffer
noremap <leader>bd :bd<cr>

"" indent visual selected code without unselecting and going back to normal mode
vnoremap > >gv
vnoremap < <gv
"" Visually select the text that was last edited/pasted
nnoremap gV `[v`]

"" pull word under cursor into lhs of a substitute (for quick search and replace)
nmap <leader>r :%s#\<<C-r>=expand("<cword>")<CR>\>#

"" fast editing of the .vimrc
nnoremap <silent> <leader>ev :e $MYVIMRC<cr>
nnoremap <silent> <leader>sv :so $MYVIMRC<cr>

"" allow saving when you forgot sudo
cnoremap w!! w !sudo tee % >/dev/null

"" turn on spell checking
noremap <leader>spl :setlocal spell!<cr>
"" spell checking shortcuts
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>s? z=

"" toggle states
nnoremap <silent> <leader>hh :set invhlsearch<CR>
nnoremap <silent> <leader>ll :set invlist<CR>
nnoremap <silent> <leader>pp :set invpaste<CR>

nnoremap <silent> <leader>nn :set invnumber<CR>
nnoremap <silent> <leader>ii :set invrelativenumber<CR>

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
" }}}

" Plugin Configuration {{{

"" gutentags

let g:gutentags_cache_dir="~/.tags"
let g:gutentags_file_list_command = {
    \ 'markers': {
        \ '.git': 'git ls-files',
        \ '.hg': 'hg files',
        \ },
    \ }

"" fzf
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>f :GFiles<cr>
nnoremap <leader>F :Files<cr>
vnoremap <leader>f y:Files <c-r>"<cr>
nnoremap <leader>a :Ag<space>
vnoremap <leader>a y:Ag <c-r>"<cr>
nnoremap <leader>A :Ag <c-r><c-w><cr>
nnoremap <leader>c :Commits<cr>

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

"" Unimpaired
"" bubble single lines
nnoremap <leader>k [e
nnoremap <leader>j ]e
"" bubble multiple lines
vnoremap <leader>k [egv
vnoremap <leader>j ]egv

"" Indent Guides
nnoremap <leader>g :IndentGuidesToggle<CR>

"" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"


" Tex
let g:tex_flavor = "latex"
let g:livepreview_previewer = 'zathura'

" markdown
let g:markdown_fenced_languages = [
      \ 'html',
      \ 'javascript', 'js=javascript', 'json=javascript'
      \ ]
" }}}

" Autocmd Rules {{{

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

" }}}

" probably not needed {{{

"" disable visual bell
"set visualbell
"set t_vb=

"" spelling
"set spelllang=en,de
"}}}
