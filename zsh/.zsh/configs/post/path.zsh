# ensure dotfiles bin directory is loaded first
PATH="$HOME/local/bin:$PATH"

# load rbenv if available
if command -v rbenv >/dev/null; then
  eval "$(rbenv init - --no-rehash)"
fi

# nvm
NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

export -U PATH
