" .vimrc

" Use Vim not vi settings
set nocompatible

" gui appearence 
if has("gui_running")
  colorscheme slate
  set guifont=Terminus\ 8
endif

" term appearence 
set background=dark

" always show ruler
set ruler

"of course
syntax on

" I work with buffers, when I open a buffer that is recently open in a window,
" don't open this buffer twice: switch to the already open one! Nice for :make, :cn, ... ;-)
set switchbuf=useopen
" title
set titlestring=%<%F\ %M%=%l/%L\ -\ %p%% titlelen=70

" display linenumber
set number

" search related settings

" show parial pattern matches in real time
set incsearch
" I like highlighted search pattern
set hlsearch
" search for upper and lowercase
set ignorecase
" but if user type uppercase - search exaclty
set smartcase


" no backup, we got scm :)
set nobackup

"use a scrollable menu for filename completions
set wildmenu

"ignore class and object files
set wildignore=*.class,*.o,*.bak,*.swp,*.pyc


" spelling stuff
if version >= 700
  " spelling files:
  " http://ftp.vim.org/pub/vim/runtime/spell/
  " move de.latin1.spl and de.latin1.sug to RUNTIME/spell
  set spelllang=de
  set sps=best,10
  set omnifunc=ccomplete#Complete
map <S-h> gT
map <S-l> gt
else
" spell check for the folloging files
  let spell_auto_type = "tex,mail,text,human"
  let spell_markup_ft = ",tex,mail,text,human"
  let spell_guess_language_ft = ""
endif

"maximum mumber of undos
set undolevels=1000

" indent stuff, tab stuff for all files
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

" no swp file cluttering in workdir
set directory=~/.vimswp

"I need more information
set statusline=%<%F%=\ [%1*%M%*%n%R%H%Y]\ \ %-25(%3l,%c%03V\ \ %P\ (%L)%)%12o'%03b''%03B'
"always show statusline
set laststatus=2

"modus (insert,visual ...)
highlight modeMsg	    cterm=bold ctermfg=white  ctermbg=blue
"active statusLine
highlight statusLine  	cterm=bold ctermfg=yellow ctermbg=red 
"inactive statusLine
highlight statusLineNC 	cterm=bold ctermfg=black  ctermbg=white
"visual mode
highlight visual		cterm=bold ctermfg=yellow ctermbg=red
"cursor colors
highlight cursor        cterm=bold 
"vertical line on split screen
highlight VertSplit     cterm=bold ctermfg=yellow ctermbg=yellow

" highlight spell errors
highlight SpellErrors ctermfg=Red cterm=underline term=reverse

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TEXT FORMATING


if has("autocmd")

  filetype on
    augroup filetype
    filetype plugin indent on
    autocmd BufNewFile,BufRead *.txt set filetype=human
  augroup END

  "vim jumps always to the last edited line, if possible
  "autocmd BufRead *,.* :normal '"
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  "in human-language files, automatically format everything at 78 chars:
  autocmd FileType mail,human 
    \ set spelllang=de formatoptions+=t textwidth=78 nocindent dictionary=/usr/share/dict/words
  

  "LaTeX to the fullest! ...dislike overlong lines:
  autocmd FileType tex set formatoptions+=t textwidth=80 nocindent
  autocmd FileType tex set makeprg=pdflatex\ %

  "for C-like programming, have automatic indentation:
  autocmd FileType slang set cindent tabstop=4 shiftwidth=4 tw=78


  "for actual C programming where comments have explicit end
  "characters, if starting a new line in the middle of a comment automatically
  "insert the comment leader characters:
  "for a more _weighty_ comments use: comments=sl:/*,mb:**,elx:*/
  autocmd FileType c,cpp set formatoptions+=ro dictionary=$HOME/.vim/c_dictionary
                       \ tw=78 tabstop=4 shiftwidth=4 noexpandtab cindent

  
  " indent xml code
  augroup xml
      map ,mf !xmllint --format --recover - 2>/dev/null<CR>
  "    au!
  "    autocmd BufWrite *xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"
  augroup END

  "for both CSS and HTML, use genuine tab characters for indentation, to make
  "files a few bytes smaller:
  autocmd FileType html,css set noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

  "in makefiles, don't expand tabs to spaces, since actual tab characters are
  "needed, and have indentation at 8 chars to be sure that all indents are tabs
  "(despite the mappings later):
  autocmd FileType make     set noexpandtab shiftwidth=8
  autocmd FileType automake set noexpandtab shiftwidth=8

endif " has("autocmd")


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OMNICOMPLETION

autocmd FileType python					set omnifunc=pythoncomplete#Complete
autocmd FileType javascript			set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html						set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css						set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml						set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php						set omnifunc=phpcomplete#CompletePHP
autocmd FileType c							set omnifunc=ccomplete#Complete
autocmd FileType rb,ruby,eruby	set omnifunc=rubycomplete#Complete
autocmd FileType sql						set omnifunc=sqlcomplete#Complete
autocmd Filetype *							set omnifunc=syntaxcomplete#Complete


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS

"" Function Keys Sector

"write a changelog entry upon pressing F1
"nnoremap <silent> <F1> :r !date<CR>Thomas Ruoff <ThomasRuoff@gmail.com><CR><CR>
"F2 -> F4  == misc
"search the current word under cursor in all files in working directory
nnoremap <silent> <F2> vawy:! grep -n -H <C-R>" .* *<CR>

nnoremap <silent> <F3> :NERDTreeToggle<CR>

"compile, translate, ...
map <F5> :make<CR>

" F9 F11 Shift-F11 and F12 are used in python mode

set pastetoggle=<F10>

"F11 -> F12 == resize window
"map <F11>   <ESC>:resize -5 <CR>
"map <F12>   <ESC>:resize +5 <CR>

python << EOF
import os
import sys
import vim
for p in sys.path:
	if os.path.isdir(p):
		vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF
"use ctags
set tags+=$HOME/.vim/tags/python.ctags
"remap tag jumping
map <silent><C-Left> <C-T>
map <silent><C-Right> <C-]>
"remap code complete to ctrl space
inoremap <Nul> <C-x><C-o>
"tab nav with alt left or right
map <silent><A-Right> :tabnext<CR>
map <silent><A-Left> :tabprevious<CR>
filetype plugin indent on
python << EOL
import vim
def EvaluateCurrentRange():
	eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOL
map <C-h> :py EvaluateCurrentRange()

" vim:set ts=2 tw=80:
