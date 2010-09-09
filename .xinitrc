#!/bin/sh

# D-Bus
eval "$(dbus-launch --sh-syntax --exit-with-session)"

# Keyring
eval $(gnome-keyring-daemon)
export GNOME_KEYRING_PID GNOME_KEYRING_SOCKET SSH_AUTH_SOCK

# wmii
export WMII_ADDRESS="unix!/tmp/ns.jonas.:0/wmii"
wmii > ~/sys/logs/wmii 2>&1 &

nm-applet > ~/sys/logs/nm-applet 2>&1 &
#xchat &

xset m 5 3
synclient HorizTwoFingerScroll=1
syndaemon -d -i 1 -t

~/.xinitrc.private &

~/sys/bin/x-session
