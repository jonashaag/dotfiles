#!/usr/bin/env python
import sys
import os

wmii_statusbar = __import__('wmii-statusbar')

def main():
    from time import sleep
    sleeptime = int(sys.argv[1])

    while True:
        os.system('xsetroot -name "%s"' % ' | '.join(callback() for _, callback in wmii_statusbar.FILES).strip('\n'))
        sleep(sleeptime)


if __name__ == '__main__':
    main()

