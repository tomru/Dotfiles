# load zgen
source "${HOME}/.dotfiles/zgen/zgen.zsh"

if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh lib/spectrum.zsh
    zgen oh-my-zsh lib/directories.zsh
    zgen oh-my-zsh lib/grep.zsh
    zgen oh-my-zsh lib/history.zsh
    zgen oh-my-zsh lib/misc.zsh
    zgen oh-my-zsh plugins/common-aliases
    zgen oh-my-zsh plugins/frontend-search

    zgen load zsh-users/zsh-completions src
    zgen load zsh-users/zsh-syntax-highlighting

    zgen load peterhurford/git-it-on.zsh
    zgen load gerges/oh-my-zsh-jira-plus

    zgen load mafredri/zsh-async
    zgen load sindresorhus/pure

    zgen save
fi

########################
# Other settings 
########################
setopt auto_cd
setopt multios
setopt cdablevars

########################
# Aliases
########################
alias _=sudo
alias g=git
alias ta='tmux attach -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
rl () { $(npm bin)/$* }

# utt time tracking
alias ua='uttr --add'
alias uah='uttr --add hello'
alias uas='uttr --add standup'
alias ual='uttr --add "lunch**"'
alias ue='uttr --edit'
alias urw='uttr --report=week'
alias urlw='uttr --report=lastWeek'
alias urm='uttr --report=month'
alias urlm='uttr --report=lastMonth'

# colors
autoload -U colors && colors
alias ls='ls --color=tty'

# keybindings

bindkey -v
export KEYTIMEOUT=1

# prevent 2*ESC-i insert-mode switch failure
noop () { }
zle -N noop
bindkey -M vicmd '\e' noop

bindkey '^P' up-history
bindkey '^N' down-history

bindkey '^r' history-incremental-search-backward
bindkey ' ' magic-space

# Base16 Shell
BASE16_SCHEME="solarized"
BASE16_SHELL="$HOME/.base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

