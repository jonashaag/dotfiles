import sys

log = sys.stdin.read()
skip = False
prev = None
for line in log.split('\n'):
    if '== Invalid read of size 4' in line:
        skip = True
    else:
        if line.endswith('== '):
            skip = False
        if not skip:
            if prev != line:
                print line
                prev = line
