INSTALL_DIR=~/.dotfiles
TARGET_DIR=$HOME

for ITEM in `ls $INSTALL_DIR` ; do

	if [ "$ITEM" = "setup.sh" ] 
	then
		continue; 
	fi

	TARGET_NAME="$TARGET_DIR/.$ITEM";
	
	# backup needed
	if [ -f $TARGET_NAME ] || [ -h $TARGET_NAME ] || [ -d $TARGET_NAME ]
	then
		echo "Found $TARGET_NAME. Backing up to ${TARGET_NAME}.pre_dotfiles";
		mv $TARGET_NAME ${TARGET_NAME}.pre_dotfiles || exit 1
	fi

	ln -s $INSTALL_DIR/$ITEM $TARGET_NAME;
	echo "Genereated symbolic link from $TARGET_NAME to $INSTALL_DIR/$ITEM";
	echo ""


done

echo 'dotfiles are installed'

