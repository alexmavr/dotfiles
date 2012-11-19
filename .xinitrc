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

# Load Xresources (for urxvt)
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Set mouse pointer icon
xsetroot -cursor_name left_ptr &

# Hide pointer when idle
unclutter &

# Composite window manager
xcompmgr -c &

# Wallpaper
nitrogen --restore &

# Dropbox
dropboxd &

# Conky
conky &

# Keyboard Shortcut to switch languages
setxkbmap -option "grp:switch,grp:alt_shift_toggle,grp_led:scroll" -layout "us,gr"  &

# Start Xmonad
exec xmonad

