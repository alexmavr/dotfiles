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

# ze wallpaper
	nitrogen --restore ~/Wallpapers &

# mouse cursor (instead of X)
	xsetroot -cursor_name left_ptr

# unclutter (hides mouse)
	unclutter &

# language change with alt-shift
	setxkbmap -layout "us, el" -option "grp:alt_shift_toggle"

# xcompmgr (for transparency)
	xcompmgr -c -C -o.65 &

# conky (script for two instances)
	/home/afein/Dropbox/conky/start-conky

# dropbox daemon
	dropboxd &

# xmonad (xmobar launches from within it for Dynamic Hooks)
	xmonad
