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

pulseaudio --start
eval $(gpg-agent -s --enable-ssh-support --daemon --write-env-file $HOME/.gpg-agent-info)

xrdb $HOME/.Xresources

# add additional fonts
xset +fp /usr/share/fonts/local
xset fp rehash

echo $1 > ~/.xinitrc-arg

case $1 in
    xterm)
        exec xterm
        ;;
    hlwm|*)  # default is herbstluftwm
        xbindkeys -n &
        urxvtd &
        udiskie --tray &
        systemctl --user start xautolock
        exec herbstluftwm --locked
        ;;
esac
