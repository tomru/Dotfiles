# my own confs

# vim keyset
bindkey -v

# no freakin' beeeep
unsetopt beep

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_NO_FUNCTIONS
setopt HIST_REDUCE_BLANKS

setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

setopt HIST_VERIFY


## get keys working
bindkey "^[[2~" yank                    # Insert
bindkey "^[[3~" delete-char             # Del
bindkey "^[[5~" up-line-or-history      # PageUp
bindkey "^[[6~" down-line-or-history    # PageDown
bindkey "^[e"   expand-cmd-path         # C-e for expanding path of typed command.
bindkey "^[[A"  up-line-or-search       # Up arrow for back-history-search.
bindkey "^[[B"  down-line-or-search     # Down arrow for fwd-history-search.
bindkey " "     magic-space             # Do history expansion on space.
case "$TERM" in
        linux|screen)
                bindkey "^[[1~" beginning-of-line       # Pos1
                bindkey "^[[4~" end-of-line             # End
        ;;
        *xterm*|(dt|k)term)
                bindkey "\eOH"  beginning-of-line       # Pos1
                bindkey "\eOF"  end-of-line             # End
                bindkey "^[[H"  beginning-of-line       # Pos1
                bindkey "^[[F"  end-of-line             # End
                bindkey "^[[7~" beginning-of-line       # Pos1
                bindkey "^[[8~" end-of-line             # End
        ;;
        rxvt|Eterm)
                bindkey "^[[7~" beginning-of-line       # Pos1
                bindkey "^[[8~" end-of-line             # End
        ;;
esac


# Completion
zmodload -i zsh/complist

# display colored directory entries
# display current dircolors with dircolors -p
if [ -f ${HOME}/.dir_colors ] ; then
    eval $(dircolors -b ${HOME}/.dir_colors)
elif [ -f /etc/DIR_COLORS ] ; then
    eval $(dircolors -b /etc/DIR_COLORS)
fi

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:*:kill:*' list-colors '=%*=01;31'

# Load the completion system
autoload -U compinit
compinit
zstyle ':completion:*:*:kill:*:jobs' verbose yes

autoload -U sched

# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# turns off spelling correction for commands
setopt nocorrect
# ORRECTALL option turns on spelling correction for all arguments
setopt nocorrectall

setopt interactivecomments

setopt extendedglob

setopt EXTENDEDGLOB     # file globbing is awesome
setopt AUTOMENU         # Tab-completion should cycle.
setopt AUTOLIST         # ... and list the possibilities.
setopt AUTO_PARAM_SLASH # Make directories pretty.
setopt ALWAYS_TO_END    # Push that cursor on completions.
setopt AUTOCD           # jump to the directory.
setopt NO_BEEP          # self explanatory
setopt AUTO_NAME_DIRS   # change directories  to variable names
setopt CHASE_LINKS      # if you pwd from a symlink, you get the actual path
setopt AUTO_CONTINUE    # automatically sent a CONT signal by disown
setopt LONG_LIST_JOBS   # List jobs in the long format by default

# zgitinit and prompt_wunjo_setup must be somewhere in your $fpath, see README for more.

setopt promptsubst

# Load the prompt theme system
autoload -U promptinit
promptinit

# Use the wunjo prompt theme
prompt adam2 

if [ -f $HOME/.local_profile ] ; then
    . $HOME/.local_profile
fi

# Alias

if [ -f $HOME/.zsh/zshalias ] ; then
	. $HOME/.zsh/zshalias
fi
