#!/bin/sh

LOG_DIR=/tmp/logs/
if [ $DISPLAY != ":0" ]; then
  LOG_DIR=$LOG_DIR/"$DISPLAY"
fi
mkdir -p "$LOG_DIR"

if pidof ssh-agent; then
  killall ssh-agent
fi;
eval $(ssh-agent)

rm -r .cache/chromium && sync-chromium &


xmodmap .Xmodmap
xset m 10 5

dwm | grep -v 'missing fontset' &
dwm-status.sh &

xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 8 1
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 8 2


sleep 60
sudo ntpdate de.pool.ntp.org


while true; do sleep 1; done
