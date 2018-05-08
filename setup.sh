INSTALL_DIR=~/.dotfiles
TARGET_DIR=$HOME

cd $INSTALL_DIR

stow $(ls -d */ | xargs basename --multiple)
echo 'dotfiles are installed'

