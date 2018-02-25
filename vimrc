" vim:      set fenc=utf-8 ft=vim fdm=marker fmr={{{,}}}:
" author:   Thomas Ruoff

" Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'

" Plug 'Raimondi/delimitMate'

" project config
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-projectionist'

" navigating in project
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-grepper'
Plug 'ludovicchabant/vim-gutentags'

" linting
Plug 'w0rp/ale'

" completion
Plug 'maralla/completor.vim', { 'do': 'make js'}

" git related
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

" appearence
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'

" filetypes
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" javascript
Plug 'pangloss/vim-javascript'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'mxw/vim-jsx'

" previews
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" debug
Plug 'tweekmonster/startuptime.vim'

" Investigate on custom text object, seems really usefull
" Plug 'kana/vim-textobj-user'
" Plug 'jceb/vim-textobj-uri' | Plug 'kana/vim-textobj-user'
" Plug 'kana/vim-textobj-indent' | Plug 'kana/vim-textobj-user'

call plug#end()
" }}}

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
set hlsearch

set gdefault

set number
set report=0

set showcmd
set showmatch

set spell
set spellcapcheck=
set complete+=kspell

"" netrw
let g:netrw_liststyle = 1
let g:netrw_sizestyle = "H"
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_hide = 1
"let g:netrw_banner = 0


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

set tabstop=8
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

let mapleader=','
let maplocalleader=','

"" fast escaping
inoremap jj <ESC>

"" delete buffer
noremap <leader>bd :bd<cr>

"" indent visual selected code without unselecting and going back to normal mode
vnoremap > >gv
vnoremap < <gv

"" Visually select the text that was last edited/pasted
nnoremap gV `[v`]

"" fast editing of the .vimrc
nnoremap <silent> <leader>ev :e $MYVIMRC<cr>

"" cheetsheet
nnoremap <silent> <leader>ec :e ~/.vim/cheetsheet.md<cr>

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

"" editorconfig
let g:EditorConfig_core_mode = 'python_external'
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"" vim-grepper
nnoremap <leader>/ :Grepper -tool rg<cr>

let g:grepper = {}
let g:grepper.tools = ['rg', 'git', 'ag', 'grep']

"" gutentags
let g:gutentags_cache_dir="~/.tags"
let g:gutentags_file_list_command = {
    \ 'markers': {
        \ '.git': 'git ls-files',
        \ '.hg': 'hg files',
        \ },
    \ }

"" Grepper
nnoremap <leader>g :Grepper -tool git<cr>
nnoremap <leader>G :Grepper -tool ag<cr>
nnoremap <leader>* :Grepper -tool ag -cword -noprompt<cr>

nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)

"" fzf
nnoremap <leader>bb :Buffers<cr>
nnoremap <leader>ff :GFiles<cr>
nnoremap <leader>FF :Files<cr>
vnoremap <leader>ff y:Files <c-r>"<cr>
nnoremap <leader>cc :Commits<cr>
nnoremap <leader>hf :History<cr>

"" ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <Leader>gq <Plug>(ale_fix)
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

"" lightline
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

"" Ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" markdown preview
let g:instant_markdown_autostart = 0
let g:instant_markdown_slow = 1
nnoremap <leader>lp :InstantMarkdownPreview<CR>

" Tex
let g:tex_flavor = "latex"
let g:livepreview_previewer = 'zathura'

" markdown
let g:markdown_fenced_languages = [
      \ 'html',
      \ 'javascript', 'js=javascript', 'json=javascript'
      \ ]

" vim-jsx
let g:jsx_ext_required = 0

" }}}

" Autocmd Rules {{{

augroup general
    autocmd!
    "" do syntax highlight syncing from start
    autocmd BufEnter * :syntax sync fromstart
    autocmd FileType netrw setl bufhidden=delete
augroup END

"" txt, mail, tex
augroup text
    autocmd!
    autocmd FileType text,markdown,mail,tex set wrap wm=2 nocindent spell
augroup END

"" JavaScript
augroup web
    autocmd!
    autocmd FileType javascript map <leader>r <esc>:TernRename<CR>
    autocmd BufRead,BufNewFile *.template set filetype=html.mustache syntax=mustache
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

