#!/usr/bin/env python

import io
import os
import re
import shutil
import sys
import tempfile

def valuable(cmd : str, cmdpatterns : io.TextIOWrapper):
    found = False
    for cp in cmdpatterns:
        if found := re.match(cp, cmd):
            break
    cmdpatterns.seek(0)
    return found

def filter_histfile(cmdpatterns : io.TextIOWrapper, temp : io.TextIOWrapper, histfile : io.TextIOWrapper):
    for cmd in histfile:
        if valuable(cmd, cmdpatterns):
            temp.write(str.encode(cmd))
    temp.seek(0)
    shutil.copyfile(temp.name, histfile.name)

if len(sys.argv) > 1 and os.path.exists(sys.argv[1]):
    with open(sys.argv[1]) as cmdpatterns:
        with tempfile.NamedTemporaryFile() as temp:
            with open(os.environ['HISTFILE'], 'r+') as histfile:
                filter_histfile(cmdpatterns, temp, histfile)
else:
    print("Provide a file name that points to a file with newline delimited Lib/re compatible regular expressions")
