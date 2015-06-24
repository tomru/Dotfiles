# load zgen
source "${HOME}/.dotfiles/zgen/zgen.zsh"

if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh
    zgen oh-my-zsh themes/robbyrussell

    zgen load zsh-users/zsh-completions src
    zgen load zsh-users/zsh-syntax-highlighting

    zgen load peterhurford/git-it-on.zsh
    zgen load gerges/oh-my-zsh-jira-plus

    zgen save
fi

