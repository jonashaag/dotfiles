#!/bin/sh

# D-Bus
eval "$(dbus-launch --sh-syntax --exit-with-session)"

xbindkeys

# Keyring
eval $(gnome-keyring-daemon)
export GNOME_KEYRING_PID GNOME_KEYRING_SOCKET SSH_AUTH_SOCK

# wmii
export WMII_ADDRESS="unix!/tmp/ns.jonas.:0/wmii"
wmii > .logs/wmii 2>&1 &

nm-applet > .logs/nm-applet 2>&1 &
#xchat &

xset m 4
synclient HorizTwoFingerScroll=1
#amixer set Front unmute >/dev/null

.bin/autostart
.bin/x-session
