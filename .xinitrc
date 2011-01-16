#!/bin/sh

pidof X > /dev/null
if [ $? -ne 0 ]; then
  START_SERVICES=false
else
  START_SERVICES=true
fi

if $START_SERVICES; then
  # D-Bus
  eval "$(dbus-launch --sh-syntax --exit-with-session)"

  # Keyring
  eval $(gnome-keyring-daemon)
  export GNOME_KEYRING_PID GNOME_KEYRING_SOCKET SSH_AUTH_SOCK
fi

if [ $DISPLAY != ":0" ]; then
  LOG_SUBDIR=/$DISPLAY
else
  LOG_SUBDIR=""
fi

# wmii
export WMII_ADDRESS="unix!/tmp/wmii-$DISPLAY.sock"
wmii -a $WMII_ADDRESS > ~/sys/logs$LOG_SUBDIR/wmii 2>&1 &

if $START_SERVICES; then
  nm-applet > ~/sys/logs/nm-applet 2>&1 &
  ~/.xinitrc.private &
fi

xset m 5 3
synclient HorizTwoFingerScroll=1
syndaemon -d -i 1 -t

~/sys/bin/x-session
