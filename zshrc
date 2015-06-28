# load zgen
source "${HOME}/.dotfiles/zgen/zgen.zsh"

if ! zgen saved; then
    echo "Creating a zgen save"

    zgen load zsh-users/zsh-completions src
    zgen load zsh-users/zsh-syntax-highlighting

    zgen load peterhurford/git-it-on.zsh
    zgen load gerges/oh-my-zsh-jira-plus

    zgen load mafredri/zsh-async
    zgen load sindresorhus/pure

    zgen save
fi

# keybindings

bindkey '^r' history-incremental-search-backward
bindkey ' ' magic-space

# history settings (from oh-my-zsh)
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

