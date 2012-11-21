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

# Start trayyer
trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 6 --transparent true --alpha 0 --tint 0x000000 --height 16 & 

# Start Xmonad
exec xmonad

