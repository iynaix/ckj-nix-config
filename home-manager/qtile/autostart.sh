#!/bin/sh

# Dunst

dunst & disown

# Gestures

libinput-gestures-setup start & disown

# Wallpaper

feh --randomize --bg-scale ~/Pictures/Wallpapers/Skulls/*

# Picom

picom & disown # --experimental-backends --vsync should prevent screen tearing on most setups if needed

# Bluetooth

blueman-applet & disown

# Ethernet & Wi-Fi

nm-applet & disown

# Low battery notifier

# ~/.config/qtile/scripts/check_battery.sh & disown

# Start Polkit Agent from GNOME

# /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & disown 
