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

# BW specific stuff
JIRA_URL="https://jira.brandwatch.com"

alias gfu="git fetch upstream"

alias gcbi="git checkout -b $1 upstream/ui-revamp-integration"
alias gcbs="git checkout -b $1 upstream/ui-revamp-stage"
alias gcbl="git checkout -b $1 upstream/ui-revamp-live"

alias gcboi="git checkout -b $1 upstream/integration"
alias gcbos="git checkout -b $1 upstream/stage"
alias gcbol="git checkout -b $1 upstream/live"

