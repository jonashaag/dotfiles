#!/usr/bin/env python
import os
import sys
import re

FILES = []

def get_output(cmd):
    return os.popen(cmd).read()

def register(callback):
    FILES.insert(0, (callback.func_name,  callback))
    return callback

@register
def clock():
    return get_output('date')

@register
def memusg():
    try:
        table = get_output('vmstat -S M').strip('\n').split('\n')[-1]
        free, buf, cache = map(int, re.split('\s+', table.strip(' '))[3:6])
        return 'mem: %sM' % (free+buf+cache)
    except (ValueError, IndexError):
        return 'no mem usg'

@register
def cpuload():
    try:
        return 'cpu: ' + re.findall('all\s+\d+\.\d+', get_output('mpstat'))[0]\
               .lstrip('all').strip() + '%'
    except IndexError:
        return 'no cpuload'

MOCP_FORMAT_STRING = "%(artist)s -- %(songtitle)s %(album)s %(currenttime)s"
@register
def mocp_state():
    state = get_output('mocp -i 2>/dev/null')
    if not state:
        return 'no moc'
    state = dict((lambda x, y='': (x.lower(), y))(*line.split(': ')) for line
                 in state.strip('\n').split('\n'))
    try:
        return MOCP_FORMAT_STRING % state
    except KeyError:
        return ''

@register
def battery_state():
    try:
        batstate = get_output('acpitool -b').split(':')[1].strip()
        if 'discharging' in batstate:
            try:
                if float(batstate.split(' ')[1][:-1]) < 15:
                    return 'WARNING: %s' % batstate
            except (IndexError, ValueError, TypeError):
                pass
        return batstate
    except IndexError:
        return 'BAT0: not present'


def main():
    from time import sleep
    sleeptime = int(sys.argv[1])

    while True:
        for index, (file, callback) in enumerate(FILES):
            os.system('echo -n "%(content)s" | wmiir create /rbar/%(i)s%(file)s' % {
                'i' : index,
                'file' : file,
                'content' : callback()
            })
        sleep(sleeptime)


if __name__ == '__main__':
    main()
