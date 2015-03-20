export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="pygmalion"

plugins=(bower gitfast git-extras node npm pass screen vi-mode tmux)

case $(hostname) in
    t430s-arch|pi)
        plugins+=(archlinux systemd)
        ;;
    cassiopeia.uberspace.de)
        plugins+=()
        ;;
    everard)
        plugins+=(debian jira)
        ;;
esac

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# turn of autocorrection
unsetopt correct_all

#################
## Keybindings
################
bindkey "^P" vi-up-line-or-history
bindkey "^N" vi-down-line-or-history

bindkey "^[[1~" vi-beginning-of-line   # Home
bindkey "^[[4~" vi-end-of-line         # End
bindkey '^[[2~' beep                   # Insert
bindkey '^[[3~' delete-char            # Del
bindkey '^[[5~' vi-backward-blank-word # Page Up
bindkey '^[[6~' vi-forward-blank-word  # Page Down

bindkey -M viins '^r' history-incremental-search-backward
bindkey -M vicmd '^r' history-incremental-search-backward

bindkey -a 'gg' beginning-of-buffer-or-history
bindkey -a 'g~' vi-oper-swap-case
bindkey -a G end-of-buffer-or-history

bindkey -a u undo
bindkey -a '^R' redo
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char


TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}

##################
# Source Things
#################

# solarized dircolors
source ~/.dircolors

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# rvm
if [ -s "$HOME/.rvm/scripts/rvm" ] ; then
    source $HOME/.rvm/scripts/rvm
    export PATH="$PATH:$HOME/.rvm/bin"
fi
