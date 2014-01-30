#!/bin/sh
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

start-pulseaudio-x11
eval $(gpg-agent --daemon) &

xrdb $HOME/.Xresources

# add additional fonts
xset +fp /usr/share/fonts/local
xset fp rehash

case $1 in
    enlightenment)
        exec enlightenment_start
        ;;
    xterm)
        exec xterm
        ;;
    bspwm)
        sxhkd &
        exec bspwm
        ;;
    hlwm|*)  # default is herbstluftwm
        /usr/bin/xscreensaver -no-splash &
        xbindkeys &
        exec herbstluftwm --locked
        ;;
esac
