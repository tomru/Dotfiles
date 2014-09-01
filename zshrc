export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="pygmalion"

plugins=(bower gitfast git-extras node npm pass screen vi-mode)

case $(hostname) in
    t430s-arch)
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

#################################
## Custom Functions And Aliases
#################################

# List all
alias ll="ls -alF"

# git aliases
alias gch="git checkout"
alias gco="git commit"
alias gadd="git add"
alias glog="git log --all"
alias giraffe="git log --graph --pretty=oneline --abbrev-commit"

# Remote X over SSH
alias sex="ssh -C -X -c blowfish"

alias -s bz2='tar -xjvf'
alias -s gz='tar -xzvf'
alias -s xz='tar -xJvf'


##############
## VCS info
#############

setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '%F{242}%s%F{238}-%F{247}%b %F{238}(%F{244}%a%F{238})%f'
zstyle ':vcs_info:*' formats '%F{242}%s%F{238}-%F{247}%b%f'
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

vcs_info_wrapper() {
    vcs_info
    if [ -n "$vcs_info_msg_0_" ]; then
        echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
    fi
}


############
## Colors
###########

alias ls="ls --color"

# Now replace all the greps!
# I'm gonna be honest, I forget what fgrep and egrep are.
# But the place I grabbed this from had them, so w/e
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"


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

##################
# Source Things
#################

# https://github.com/clvv/fasd
if command -v fasd >/dev/null 2>&1 ; then
    eval "$(fasd --init auto)"
    alias v='f -e vim' # quick opening files with vim
    alias m='f -e mplayer' # quick opening files with mplayer
    alias o='a -e xdg-open' # quick opening files with xdg-open
fi

# solarized dircolors
source ~/.dircolors

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
