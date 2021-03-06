" vim:      set fenc=utf-8 ft=vim fdm=marker fmr={{{,}}}:
" author:   Thomas Ruoff

" Basics {{{
set hidden
set ttyfast
set lazyredraw
set updatetime=300
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
    nnoremap <leader>w :Windows<cr>
    nnoremap <leader>m :Maps<cr>
    nnoremap <leader>h :Helptags<cr>
    nnoremap <leader>/ :Rg<cr>
    nnoremap <leader>* :Rg <C-r><C-a><cr>
    nnoremap <leader>C :Commands<cr>

Plug 'junegunn/vim-peekaboo'
Plug 'machakann/vim-highlightedyank'

Plug 'editorconfig/editorconfig-vim'
    let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

Plug 'tpope/vim-projectionist'

Plug 'mbbill/undotree'
    nnoremap <leader>u :UndotreeToggle<cr>

Plug 'w0rp/ale'
    nmap <silent> [a <Plug>(ale_previous_wrap)
    nmap <silent> <C-j> <Plug>(ale_next_wrap)
    let g:ale_linters = {}
    let g:ale_linters.javascript = ['eslint']
    let g:ale_fixers = {}
    let g:ale_fixers.javascript = ['eslint']
    let g:ale_fix_on_save = 1

Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    " Use `[c` and `]c` to navigate diagnostics
    nmap <silent> [d <Plug>(coc-diagnostic-prev)
    nmap <silent> ]d <Plug>(coc-diagnostic-next)
    " Remap for rename current word
    nmap <leader>rn <Plug>(coc-rename)
    " Remap for do codeAction of current line
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Fix autofix problem of current line
    nmap <leader>qf  <Plug>(coc-fix-current)

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

Plug 'lifepillar/vim-gruvbox8'

Plug 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger="<S-Tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-k>"
    let g:UltiSnipsJumpBackwardTrigger="<c-j>"

Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'

Plug 'sheerun/vim-polyglot'
    let g:polyglot_disabled = ['javascript', 'jsx', 'latex']

Plug 'lervag/vimtex', { 'for': 'tex' }
    let g:vimtex_view_method = 'zathura'

Plug 'wellle/targets.vim'

Plug 'janko-m/vim-test'
  nmap <silent> <leader>t :TestNearest<CR>
  nmap <silent> <leader>T :TestFile<CR>
  let test#strategy = "vimterminal"

" vim 8 plugins
if v:version >= 800
    Plug 'ludovicchabant/vim-gutentags'
        let g:gutentags_cache_dir="~/.tags"
        let g:gutentags_file_list_command = {
            \ 'markers': {
                \ '.git': 'git ls-files',
                \ '.hg': 'hg files',
                \ },
            \ }
endif


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

if v:version > 800
    set breakindent
endif

set showbreak=↳
set textwidth=0
set colorcolumn=+1
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
colorscheme gruvbox8

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
inoremap jk <ESC>

"" delete buffer
noremap <leader>d :bd<cr>

"" indent visual selected code without unselecting and going back to normal mode
vnoremap > >gv
vnoremap < <gv

"" Visually select the text that was last edited/pasted
nnoremap gV `[v`]

"" session management (https://dockyard.com/blog/2018/06/01/simple-vim-session-management-part-1)
let g:sessions_dir = '~/.vim/sessions'
exec 'nnoremap <Leader>ss :mks! ' . g:sessions_dir . '/*.vim<C-D><BS><BS><BS><BS><BS>'
exec 'nnoremap <Leader>sr :so ' . g:sessions_dir. '/*.vim<C-D><BS><BS><BS><BS><BS>'

"" fast editing of config
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
    autocmd FileType text,markdown,mail,tex set wrap wm=2 nocindent spell textwidth=79
augroup END

augroup markdown
    autocmd!
    autocmd FileType markdown set wrap wm=2 nocindent spell textwidth=79
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

