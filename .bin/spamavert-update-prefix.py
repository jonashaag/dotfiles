#!/usr/bin/env python
import random
import string
import os

prefs_dot_js = '/home/jonas/.mozilla/firefox/jonas.default/prefs.js'

ALPHABET = string.letters + string.digits

def rands():
    return ''.join(random.sample(ALPHABET, random.randint(7, 12)))

# backup copy:
os.system('cp %s %s' % (prefs_dot_js, prefs_dot_js + '.0'))

with open(prefs_dot_js) as firefox_prefs:
    prefs = firefox_prefs.read().split('\n')

for line_no, line in enumerate(prefs):
    if 'spamavert.prefix' in line:
        break

prefs[line_no] = 'user_pref("extensions.spamavert.prefix", "%s");' % rands()

with open(prefs_dot_js, 'w') as firefox_prefs:
    firefox_prefs.write('\n'.join(prefs))
