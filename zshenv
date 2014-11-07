##################
# Source Things
#################

# solarized dircolors
[ -s ~/.dircolors ] && . ~/.dircolors

# extend path
export PATH=$HOME/local/bin:$PATH

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# todo.sh
alias t=todo.sh

# Base16 Shell
BASE16_SCHEME="solarized"
BASE16_SHELL="$HOME/.base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

DIST=$(lsb_release -si)
case $DIST in
    Arch )
        # use python 2.7 by default
        export PYTHON=python2
        ;;
esac

# BW specific stuff
JIRA_URL="https://jira.brandwatch.com"

alias gfu="git fetch upstream"

alias gcbi="git checkout -b $1 upstream/ui-revamp-integration"
alias gcbs="git checkout -b $1 upstream/ui-revamp-stage"
alias gcbl="git checkout -b $1 upstream/ui-revamp-live"

alias gcboi="git checkout -b $1 upstream/integration"
alias gcbos="git checkout -b $1 upstream/stage"
alias gcbol="git checkout -b $1 upstream/live"

