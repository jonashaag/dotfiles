#!/usr/bin/env python2
import sys; sys.path.append('/jonas/dev/moc')
import os
import re
import datetime
import moc

WARN_BATSTATE = 6
BAT_STATE_FILE = '/proc/acpi/battery/BAT0/state'
FILES = []
GERMAN_KEYBOARD = re.compile('pidgin', re.IGNORECASE)

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
@frequency(2)
@register
def clock():
    now = datetime.datetime.now()
    return now.strftime(TIME_FORMAT)

MOCP_FORMAT_STRING = "%(artist)s -- %(songtitle)s %(currenttime)s"
@frequency(2)
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
    try:
        batstate = get_output('acpitool -b').split(':', 1)[1].strip()
    except IndexError:
        return 'running on AC'
    if 'discharging' in batstate:
        try:
            if float(batstate.split(' ')[1].rstrip(',%')) < WARN_BATSTATE:
                batstate = 'WARNING: %s' % batstate
        except (IndexError, ValueError, TypeError):
            pass
        rate = [line for line in open(BAT_STATE_FILE).read().split('\n')
                if 'present rate' in line][0].split('rate:')[1].strip()
        return batstate + ' (%s)' % rate
    return batstate

def _get_keyboard_layout():
    x = os.popen('setxkbmap -print').read()
    if '+de' in x:
        if '+de(nodead' in x:
            return 'de nodeadkeys'
        return 'de'
    return 'us'

#@register
def keyboard_layout():
    props = os.popen('wmiir read /client/sel/props 2>/dev/null').read()
    current = _get_keyboard_layout()
    if GERMAN_KEYBOARD.match(props):
        if current[:2] == 'us':
            os.system('setxkbmap de')
            return 'de'
        return current
    else:
        if current == 'de':
            os.system('setxkbmap us')
            return 'us'
        return current

def main():
    WMII_UPDATE_CMD = 'echo -n "%s" | wmiir create /rbar/%s%s >/dev/null 2>&1'

    from time import sleep
    from itertools import count

    for i in count(1):
        for index, (file, callback) in enumerate(FILES):
            if i % getattr(callback, '_frequency', 1) != 0:
                continue
            retval = os.system(WMII_UPDATE_CMD % (callback(), index, file))
            if retval == 256:
                print "wmii seems unavailable, refusing to work."
                exit(1)

        sleep(0.5)

if __name__ == '__main__':
    main()
