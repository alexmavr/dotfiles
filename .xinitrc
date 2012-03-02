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

# urxvtd daemon (for faster terminals)
	urxvtd -q -f -o

# mouse cursor (instead of X)
	xsetroot -cursor_name left_ptr

# unclutter (hides mouse)
	unclutter &

# xcompmgr (for transparency)
	xcompmgr -c -C -o.65 &

# ze wallpaper
	nitrogen --restore ~/Wallpapers &

# xmobar (for the win)
#	xmobar &

# xmonad 
	xmonad
