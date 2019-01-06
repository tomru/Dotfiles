" vim:      set fenc=utf-8 ft=vim fdm=marker fmr={{{,}}}:
" author:   Thomas Ruoff

" Basics {{{
set hidden
set ttyfast
set synmaxcol=512
set modeline
set nobackup
set noswapfile

set mouse=a
set mousehide

set wildmode=list:longest,full
set wildignore+=*.swp,*.bak,*.jpg,*.gif,*.png,*.git,

set splitright
set splitbelow

" yank delete change and put operations go by default in `"+` register
" so in the systems clipboard accessable by CTRL-V on all OS types
if has('mac')
  set clipboard^=unnamed
else
  set clipboard^=unnamedplus
endif

" set ignorecase
set infercase
set smartcase
set ignorecase
set hlsearch

set gdefault

set number
set report=0

set showcmd
set showmatch

set spellcapcheck=
set complete+=kspell

let mapleader=" "
let maplocalleader=" "

" netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3
" sort is affecting only: directories on the top, files below
let g:netrw_sort_sequence = '[\/]$,*'

" }}}

" Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
    nnoremap <leader>b :Buffers<cr>
    nnoremap <leader>f :GFiles<cr>
    nnoremap <leader>F :Files<cr>
    nnoremap <leader>c :Commits<cr>
    nnoremap <leader>bc :BCommits<cr>
    nnoremap <leader>t :Tags<cr>
    nnoremap <leader>bt :BTags<cr>
    nnoremap <leader>l :Lines<cr>
    nnoremap <leader>bl :BLines<cr>
    nnoremap <leader>w :Windows<cr>
    nnoremap <leader>bh :History<cr>
    nnoremap <leader>ch :History:<cr>
    nnoremap <leader>sh :History/<cr>
    nnoremap <leader>vc :Commands<cr>
    nnoremap <leader>m :Maps<cr>
    nnoremap <leader>h :Helptags<cr>

Plug 'mhinz/vim-grepper'
    nnoremap <leader>/ :Grepper -tool rg<cr>
    nnoremap <leader>* :Grepper -tool rg -cword -noprompt<cr>
    let g:grepper = {}
    let g:grepper.tools = ['rg', 'git', 'ag', 'grep']

Plug 'editorconfig/editorconfig-vim'
    let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

Plug 'tpope/vim-projectionist'

Plug 'simnalamburt/vim-mundo'
    nnoremap <leader>u :MundoToggle

Plug 'Shougo/deoplete.nvim' | Plug 'roxma/nvim-yarp' | Plug 'roxma/vim-hug-neovim-rpc'
    let g:deoplete#enable_at_startup=1
    let g:deoplete#file#enable_buffer_path=1

Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
    let g:deoplete#sources#ternjs#filetypes = [ 'jsx', 'javascript.jsx' ]

Plug 'w0rp/ale'
    nmap <silent> <C-k> <Plug>(ale_previous_wrap)
    nmap <silent> <C-j> <Plug>(ale_next_wrap)
    nmap <Leader>gq <Plug>(ale_fix)
    let g:ale_linters = {}
    let g:ale_linters.javascript = ['eslint']
    let g:ale_fixers = {}
    let g:ale_fixers.javascript = ['eslint']

Plug 'itchyny/lightline.vim'
    if filereadable(expand("~/.vim/lightline.vim"))
        source ~/.vim/lightline.vim
        augroup ale-statusline
            autocmd!
            autocmd User ALELint call lightline#update()
        augroup END
    endif

    function! LightlineReload()
      call lightline#init()
      call lightline#colorscheme()
      call lightline#update()
    endfunction

Plug 'morhetz/gruvbox'

Plug 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger="<S-Tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-k>"
    let g:UltiSnipsJumpBackwardTrigger="<c-j>"

Plug 'ludovicchabant/vim-gutentags'
    let g:gutentags_cache_dir="~/.tags"
    let g:gutentags_file_list_command = {
        \ 'markers': {
            \ '.git': 'git ls-files',
            \ '.hg': 'hg files',
            \ },
        \ }

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
    let g:jsx_ext_required = 0

Plug 'sheerun/vim-polyglot'
    let g:polyglot_disabled = ['javascript', 'jsx', 'latex']

Plug 'lervag/vimtex', { 'for': 'tex' }

Plug 'wellle/targets.vim'

Plug 'janko-m/vim-test'

" debug
Plug 'tweekmonster/startuptime.vim'

call plug#end()
" }}}

" Local .vimrc {{{
set exrc
set secure
" }}}

" Text Formatting {{{
set list

set breakindent

set showbreak=↳
set textwidth=79
set colorcolumn=80
set nojoinspaces

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" }}}

" Folding {{{
set foldmethod=indent
set foldlevelstart=1
set nofoldenable
" }}}

" Diff settings {{{
set fillchars+=diff:⣿
set diffopt=vertical
set diffopt+=filler
set diffopt+=iwhite
" }}}

" {{{ Undo
set undodir=~/.vim/undos,/tmp
set undofile
set undolevels=1000
set undoreload=10000
" }}}

" Visual Setting {{{
"
set cursorline
set background=dark
colorscheme gruvbox

set number
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

"" fast escaping
inoremap jj <ESC>

"" delete buffer
noremap <leader>bd :bd<cr>

"" indent visual selected code without unselecting and going back to normal mode
vnoremap > >gv
vnoremap < <gv

"" Visually select the text that was last edited/pasted
nnoremap gV `[v`]

"" session management (https://dockyard.com/blog/2018/06/01/simple-vim-session-management-part-1)
let g:sessions_dir = '~/.vim/sessions'
exec 'nnoremap <Leader>ss :mks! ' . g:sessions_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>sr :so ' . g:sessions_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'

"" session management
let g:sessions_dir = '~/.vim/sessions'
exec 'nnoremap <Leader>ss :mks! ' . g:sessions_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>sr :so ' . g:sessions_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'

"" fast editing of the .vimrc
nnoremap <silent> <leader>ev :e $MYVIMRC<cr>

"" cheatsheet
nnoremap <silent> <leader>ec :e ~/.vim/cheatsheet.md<cr>

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

" Autocmd Rules {{{

augroup general
    autocmd!
    "" do syntax highlight syncing from start
    autocmd BufEnter * :syntax sync fromstart
augroup END

"" txt, mail, tex
augroup text
    autocmd!
    autocmd FileType text,markdown,mail,tex set wrap wm=2 nocindent spell textwidth=79 colorcolumn=80
augroup END

augroup markdown
    autocmd!
    autocmd FileType markdown set wrap wm=2 nocindent spell textwidth=79 colorcolumn=80
augroup END

"" Web
augroup web
    autocmd!
    autocmd FileType javascript map <leader>r <esc>:TernRename<CR>
    autocmd BufRead,BufNewFile *.template set filetype=html.mustache syntax=mustache
    autocmd BufRead,BufNewFile *.html set spell
augroup END

"" Help
augroup HelpInTabs
    autocmd!
    autocmd BufEnter *.txt call HelpInNewTab()
augroup END

"Only apply to help files...
function! HelpInNewTab ()
    if &buftype == 'help'
        "Convert the help window to a tab...
        execute "normal \<C-W>T"
    endif
endfunction

" Reloading vim
augroup VimReload
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC | call LightlineReload()
augroup END

" }}}

