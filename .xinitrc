#!/bin/sh

if [ $DISPLAY != ":0" ]; then
  LOG_SUBDIR=/$DISPLAY
else
  LOG_SUBDIR=""
fi

if ! pidof ssh-agent; then
  eval $(ssh-agent)
fi

# wmii
export WMII_ADDRESS='unix!'"/tmp/wmii-$DISPLAY.sock"
wmii -a $WMII_ADDRESS > ~/sys/logs$LOG_SUBDIR/wmii 2>&1 &

xmodmap .Xmodmap
xset m 5 3
synclient HorizTwoFingerScroll=1
synclient VertScrollDelta=150

~/sys/bin/x-session
