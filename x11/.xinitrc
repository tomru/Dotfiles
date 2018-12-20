#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

eval $(gpg-agent -s --enable-ssh-support --daemon --write-env-file $HOME/.gpg-agent-info)

DISPLAY_SCALE=1.25
export GDK_DPI_SCALE=$DISPLAY_SCALE
export QT_AUTO_SCREEN_SCALE_FACTOR=$DISPLAY_SCALE

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources


case $1 in
    xterm)
        exec xterm
        ;;
    herbstluftwm)  # default is herbstluftwm
        exec herbstluftwm --locked
        ;;
    *)
        exec $1
        ;;
esac
