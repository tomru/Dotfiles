# VIM CHEETSHEET

Generel stuff that I need to get into my muscle memory.

* `C-W [hjkl]` - switch to window left, above, below, right
* `C-L` - clear highlight

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

## Grepper

* `<leader>g` - kick off
* without entering anything, takes word under the cursor

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

## GitGutter

* `]c`, `[c` - jump to next/prev hunk (*c*hange)
* `<leader>hs` - stage hunk
* `<leader>hu` - undo hunk

## Debugging

* `<leader>DD` - start profiling
* `<leader>DP` - pause profiling, output in `profile.log`
