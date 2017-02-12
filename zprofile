# extend path
export PATH="$HOME/local/bin:$PATH"

export EDITOR=$(which vim)

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# rbenv
if [ -s "$HOME/.rbenv/bin/rbenv" ] ; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

# in case there are local settings needed
if [ -s "$HOME/.zprofile.local" ] ; then
    source $HOME/.zprofile.local
fi

# Dist related settings
case $OSTYPE in
    "darwin14.0"|"darwin15.0" )
        export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
        export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"
        #eval $(ssh-agent -s)
        ;;
    "linux-gnu" )
        export ANDROID_HOME=~/local/android-sdk
        export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
        ;;
esac
