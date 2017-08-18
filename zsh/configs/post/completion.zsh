# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
