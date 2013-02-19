# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="blinks"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git svn debian npm node)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# local node install
NODE_PATH="$HOME/local"
if [ -d $NODE_PATH ] ; then
    PATH="$NODE_PATH/bin:$PATH"
    export NODE_PATH
fi

# python pip local
PIP_PATH="$HOME/.local"
if [ -d $PIP_PATH ] ; then
    PATH="$PIP_PATH/bin:$PATH"
    export PIP_PATH
fi

# Vim Powerline if on path
if command -v powerline > /dev/null ; then
    . ~/.vim/bundle/powerline/powerline/bindings/zsh/powerline.zsh
fi
