# VIM CHEAT SHEET

Generel stuff that I need to get into my muscle memory.

* `C-W [hjkl]` - switch to window left, above, below, right
* `C-W x` - switch to windows
* `C-W C-o` - only current window, close others
* `C-L` - clear highlight
* `<C-o><C-o>` - Jump to last edited filed
* `Control-o <<command>>` - For a single normal operation in insert mode 
* `gx` - on URL/file via xdg-open/open
* `:g/<<some-pattern>>/d` delete lines containing pattern
* `:v/<<some-pattern>>/d` delete lines NOT containing pattern
* `g[;,]` - goto older/newer position in changelist

### edit macros
* `"ip` to past register `i` in buffer
* `"iyy` to yank into register `i`

## search'n'replace
* `\ze` in regular expressions to start from here with replacing

## Remember lately added config

* `gdefault` - do always global substitute
* read again and again `:h grepper`

## yanking

* `"ay` - replace content of register 'a'
* `"Ay` - append to content of register 'a'
* `y` - will put stuff in the default register `""` and `"0`
* `d` - will put stuff just in the default register `""` - so `"0p` will still
  paste the last yank
* `3yy` - yank next three lines
* `C-r +` - paste register '+' in insert mode
* `"*` - linux the PRIMARY clipboard, system clipboard on other operating
  systems
* `"+` - the system clipboard on all operating systems

## unimpared

* `]b` - :bnext
* `[b` - :bprevious
* `]B` - :bfirst
* `[B` - :blast

## surround

* `cs"'` - changes surrouding " to '
* `ysiw<em>` to add `<em></em>` around a word

## undo

* `g+` `g-` - move to previous change, regardless of where it sits in the undo
    tree

## Grepper

* `<leader>g` - kick off
* without entering anything, takes word under the cursor

## GitGutter

* `]c`, `[c` - jump to next/prev hunk (*c*hange)
* `<leader>hs` - stage hunk
* `<leader>hu` - undo hunk

## options

Generally `[o` is to enable, `]o` to disable and `=o` to toggle an
option.

* `[ob` 'background' (dark is off, light is on)
* `[oc` 'cursorline'
* `[od` 'diff' (actually |:diffthis| / |:diffoff|)
* `[oh` 'hlsearch'
* `[oi` 'ignorecase'
* `[ol` 'list'
* `[on` 'number'
* `[or` 'relativenumber'
* `[os` 'spell'
* `[ou` 'cursorcolumn'
* `[ov` 'virtualedit'
* `[ow` 'wrap'
* `[ox` 'cursorline' 'cursorcolumn' (x as in crosshairs)

## Debugging

* `<leader>DD` - start profiling
* `<leader>DP` - pause profiling, output in `profile.log`
