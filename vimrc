" vim:      set fenc=utf-8 ft=vim fdm=marker fmr={{{,}}}:
" file:     ~/.vimrc
" author:   Thomas Ruoff (with the help of a myriad others)

" Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

Plug 'L9'
Plug 'unimpaired.vim'
Plug 'surround.vim'
Plug 'Align'
Plug 'Raimondi/delimitMate'

Plug 'editorconfig/editorconfig-vim'

Plug 'lifepillar/vim-mucomplete'

Plug 'ludovicchabant/vim-gutentags'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'w0rp/ale'

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

Plug 'christoomey/vim-tmux-navigator'

call plug#end()
" }}}

" Basics {{{
set encoding=utf-8
set nocompatible

filetype plugin indent on
syntax on

set hidden
set ttyfast
set synmaxcol=512
set modeline
set nobackup
set noswapfile

set mouse=a
set mousehide

set path+=**

set wildmode=list:longest,full
set wildmenu
set wildignore+=*.swp,*.bak,*.jpg,*.gif,*.png,*.git,

let g:netrw_liststyle=3

set splitright
set splitbelow

set ignorecase
set smartcase
set incsearch
set hlsearch

set number
set report=0

set scrolloff=5

set showcmd
set showmatch

set spell
set spellcapcheck=
set complete+=kspell

" }}}

" Local .vimrc {{{
set exrc
set secure
" }}}

" Text Formatting {{{
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:␣,trail:-
set linebreak
set showbreak=↳
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set textwidth=80
set autoindent
set nojoinspaces
" }}}

" Folding {{{
set foldmethod=indent
set foldlevelstart=10
" }}}

" Diff settings {{{
set fillchars+=diff:⣿
set diffopt=vertical
set diffopt+=filler
set diffopt+=iwhite
" }}}

" {{{ Undo
set undodir=~/.vim/undos
set undofile
set undolevels=1000
set undoreload=10000
" }}}

" Visual Setting {{{
"
set background=dark
set cursorline
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

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

"" allow using . with visual mode
vnoremap . :norm.<cr>

"" Visually select the text that was last edited/pasted
nnoremap gV `[v`]

"" pull word under cursor into lhs of a substitute (for quick search and replace)
nnoremap <leader>r :%s#\<<C-r>=expand("<cword>")<CR>\>#

"" fast editing of the .vimrc
nnoremap <silent> <leader>ev :e $MYVIMRC<cr>

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

"" mucomplete
set completeopt+=menuone
set shortmess+=c
set completeopt+=noinsert

"" gutentags

let g:gutentags_cache_dir="~/.tags"
let g:gutentags_file_list_command = {
    \ 'markers': {
        \ '.git': 'git ls-files',
        \ '.hg': 'hg files',
        \ },
    \ }

"" fzf
nnoremap <leader>bb :Buffers<cr>
nnoremap <leader>ff :GFiles<cr>
nnoremap <leader>FF :Files<cr>
vnoremap <leader>ff y:Files <c-r>"<cr>
nnoremap <leader>aa :Ag<space>
vnoremap <leader>aa y:Ag <c-r>"<cr>
nnoremap <leader>AA :Ag <c-r><c-w><cr>
nnoremap <leader>cc :Commits<cr>

"" minibufexpl
map <Leader>t :MBEToggle<cr>

"" ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"" lightline
if filereadable(expand("~/.vim/lightline.vim"))
    source ~/.vim/lightline.vim
    augroup ale-statusline
        autocmd!
        autocmd User ALELint call lightline#update()
    augroup END
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
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"


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
augroup general
    autocmd!
    autocmd BufEnter * :syntax sync fromstart
augroup END

"" txt, mail, tex
augroup text
    autocmd!
    autocmd FileType text,markdown,mail,tex set wrap wm=2 textwidth=78 nocindent spell
augroup END

"" Python
augroup python
    autocmd FileType python set noexpandtab
augroup END

"" JavaScript
augroup web
    autocmd!
    autocmd FileType javascript map <leader>r <esc>:TernRename<CR>
    autocmd BufRead,BufNewFile *.json set ft=json
    autocmd BufRead,BufNewFile *.template set filetype=html.mustache syntax=mustache
augroup END

" }}}

