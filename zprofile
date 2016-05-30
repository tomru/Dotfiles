# extend path
export PATH="$HOME/local/bin:$PATH"

export EDITOR=$(which vim)

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

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
