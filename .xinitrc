#!/bin/sh

if pidof ssh-agent; then
  killall ssh-agent
fi
eval $(ssh-agent)

if pidof mini_httpd; then
  killall mini_httpd
fi
mini_httpd -h localhost -p 9999 -d dev/todo/

xmodmap .Xmodmap
xset m 10 5

dwm | grep -v 'missing fontset' &
dwm-status.sh &

xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 8 1
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 8 2
xinput set-int-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 8 6 7 4 5
synclient HorizTwoFingerScroll=1

sleep 10
sudo ntpdate de.pool.ntp.org

while true; do sleep 1; done
