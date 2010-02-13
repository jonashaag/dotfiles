#!/bin/sh
export WMII_ADDRESS="unix!/tmp/ns.jonas.:0/wmii"

xbindkeys &
eval $(gnome-keyring-daemon)
export GNOME_KEYRING_PID GNOME_KEYRING_SOCKET SSH_AUTH_SOCK
stalonetray &
ck-launch-session nm-applet &
wmii &
exec .bin/x-session
