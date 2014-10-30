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
