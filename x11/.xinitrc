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

xrdb $HOME/.Xresources

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
