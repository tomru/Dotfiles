# load zgen
source "${HOME}/.dotfiles/zgen/zgen.zsh"

if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh lib/spectrum.zsh
    zgen oh-my-zsh lib/directories.zsh
    zgen oh-my-zsh lib/grep.zsh
    zgen oh-my-zsh lib/history.zsh
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

# extend path
export PATH="$HOME/local/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# use node version specified in ~/.nvmrc as default
nvm use > /dev/null

# Base16 Shell
BASE16_SCHEME="solarized"
BASE16_SHELL="$HOME/.base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

########################
# Dist related settings
########################
case $OSTYPE in
    "darwin14.0" )
        export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
        export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"
        #eval $(ssh-agent -s)
        ;;
esac

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

# colors
autoload -U colors && colors
alias ls='ls --color=tty'

# keybindings

bindkey -v
bindkey '^P' up-history
bindkey '^N' down-history

bindkey '^r' history-incremental-search-backward
bindkey ' ' magic-space

