#!/usr/bin/python

import sys
sys.path.append(r'/home/debian/tests')
import pydevd
pydevd.settrace('192.168.7.1') # replace IP with address
                                # of Eclipse host machine


i = 3
p = 'Hello!' * i
print p