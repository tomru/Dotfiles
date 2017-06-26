source ~/.dotfiles/zplug/init.zsh


zplug "lib/spectrum", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh
zplug "lib/grep", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/misc", from:oh-my-zsh
zplug "plugins/common-aliases", from:oh-my-zsh
zplug "plugins/frontend-search", from:oh-my-zsh

zplug "zsh-users/zsh-completions", use:"src/*.zsh"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "peterhurford/git-it-on.zsh"
zplug "gerges/oh-my-zsh-jira-plus"

zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"

########################
# Other settings
########################
setopt auto_cd
setopt multios
setopt cdablevars


########################
# vi mode
########################
bindkey -v
zle -N edit-command-line
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line

########################
# Aliases
########################
alias _=sudo
alias g=git
alias nohist='unset HISTFILE'

alias reset='reset && base16_gruvbox-dark-medium'

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

export KEYTIMEOUT=1

# prevent 2*ESC-i insert-mode switch failure
noop () { }
zle -N noop
bindkey -M vicmd '\e' noop

bindkey '^P' up-history
bindkey '^N' down-history

bindkey '^r' history-incremental-search-backward
bindkey ' ' magic-space

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zplug
if ! zplug check; then
    zplug install
fi

zplug load
