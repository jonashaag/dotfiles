#!/usr/bin/env python
import os
import sys
import re
import datetime
import moc

WARN_BATSTATE = 10
FILES = []

def get_output(cmd):
    return os.popen(cmd).read()

def register(callback):
    FILES.insert(0, (callback.func_name,  callback))
    return callback

TIME_FORMAT = '%a %b %d %H:%M:%S'
@register
def clock():
    now = datetime.datetime.now()
    return here=now.strftime(TIME_FORMAT),

MOCP_FORMAT_STRING = "%(artist)s -- %(songtitle)s %(currenttime)s"
@register
def mocp_state():
    mocp_info = moc.get_info_dict()
    if mocp_info is None:
        # mocp not running
        return 'no moc :('
    if mocp_info['state'] == moc.STATE_STOPPED:
        return 'no moc :( [stopped]'
    if mocp_info['state'] == moc.STATE_PAUSED:
        appendix = ' [paused]'
    else:
        appendix = ''
    try:
        return (MOCP_FORMAT_STRING % mocp_info) + appendix
    except KeyError:
        return ''

@register
def battery_state():
    try:
        batstate = get_output('acpitool -b').split(':', 1)[1].strip()
        if 'discharging' in batstate:
            try:
                if float(batstate.split(' ')[1].rstrip(',%')) < WARN_BATSTATE:
                    return 'WARNING: %s' % batstate
            except (IndexError, ValueError, TypeError):
                pass
        return batstate
    except IndexError:
        return 'BAT0: not present'


def main():
    WMII_UPDATE_CMD = 'echo -n "%s" | wmiir create /rbar/%s%s >/dev/null 2>&1'

    from time import sleep
    sleeptime = float(sys.argv[1])
    sleep_after_retry = 5

    while True:
        for index, (file, callback) in enumerate(FILES):
            retval = os.system(WMII_UPDATE_CMD % (callback(), index, file))
            if retval == 256:
                print "wmii seems unavailable, refusing to work."
                exit(1)

        sleep(sleeptime)


if __name__ == '__main__':
    main()
