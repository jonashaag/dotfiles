#!/usr/bin/env python2
import sys; sys.path.append('/jonas/dev/moc')
import os
import re
import datetime
import moc

WARN_BATSTATE = 6
BAT_STATE_FILE = '/proc/acpi/battery/BAT0/state'
FILES = []

def get_output(cmd):
    return os.popen(cmd).read()

def register(callback):
    FILES.insert(0, (callback.func_name,  callback))
    return callback

def frequency(freq):
    def decorator(callback):
        callback._frequency = freq
        return callback
    return decorator

TIME_FORMAT = '%a %b %d %H:%M:%S'
@register
def clock():
    now = datetime.datetime.now()
    return now.strftime(TIME_FORMAT)

@register
def volume():
    return re.findall('\d+%', get_output('amixer get PCM'))[0]

MOCP_FORMAT_STRING = "%(artist)s -- %(songtitle)s %(currenttime)s"
@register
def mocp_state():
    try:
        mocp_info = moc.get_info_dict()
    except moc.MocNotRunning:
        return 'no moc :('
    except moc.MocError:
        import traceback; traceback.print_exc()
        return 'moc error'
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

@frequency(10)
@register
def battery_state():
    return get_output('acpi').split(':', 1)[1].strip().lower()

def main():
    WMII_UPDATE_CMD = 'echo -n "%s" | wmiir create /rbar/%s%s >/dev/null 2>&1'

    from time import sleep
    from itertools import count

    for i in count(1):
        for index, (file, callback) in enumerate(FILES):
            if i % getattr(callback, '_frequency', 1) != 0:
                continue
            retval = os.system(WMII_UPDATE_CMD % (' %s  ' % callback().strip(), index, file))
            if retval == 256:
                print "wmii seems unavailable, refusing to work."
                exit(1)

        sleep(1)

if __name__ == '__main__':
    main()
