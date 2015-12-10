# extend path
export PATH="$HOME/local/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

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
