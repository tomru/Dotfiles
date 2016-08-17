set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=utf-8

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'

Plug 'L9'
Plug 'unimpaired.vim'
Plug 'surround.vim'
Plug 'Align'

Plug 'editorconfig/editorconfig-vim'

Plug 'Shougo/unite.vim'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --tern-completer' }

Plug 'mbbill/undotree'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/syntastic'

Plug 'tpope/vim-fugitive'
Plug 'rhysd/conflict-marker.vim'
Plug 'airblade/vim-gitgutter'

Plug 'inside/vim-search-pulse'
Plug 'rking/ag.vim'

Plug 'BufOnly.vim'

Plug 'itchyny/lightline.vim'

Plug 'chriskempson/base16-vim'

Plug 'Raimondi/delimitMate'

Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'marijnh/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' }
Plug 'mtscout6/syntastic-local-eslint.vim', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript.jsx' }

Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

call plug#end()

"" reload when vim config changes
autocmd! bufwritepost .vimrc source %

"" enable local .vimrc
set exrc " Enable use of directory-specific .vimrc
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

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
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
colorscheme base16-solarized-dark

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
set showbreak=↳

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

"" +/-: Increment number
nnoremap + <c-a>
nnoremap - <c-x>

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

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

" persistent undo
set undodir=~/.vim/undos
set undofile
set undolevels=1000
set undoreload=10000

"
" Plugin Configuration
"

"" syntastic
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"" lightline
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! LightLineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp,*.js,*.py call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

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
nmap <leader>u :UndotreeToggle<CR>

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

" JSX
" let g:jsx_ext_required = 0 " Allow JSX in normal JS files

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
au FileType markdown set wrap wm=2 textwidth=78 nocindent spell

"" Python
au FileType python set noexpandtab

"" JavaScript
au FileType javascript map <leader>r <esc>:TernRename<CR>

"" Json
au BufRead,BufNewFile *.json set ft=json

"" Mustache
au BufRead,BufNewFile *.template set filetype=html.mustache syntax=mustache
