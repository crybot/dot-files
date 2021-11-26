#!/bin/python3
import subprocess
import sys
import os
import re

home = os.environ['HOME']
conf_path = '{}/.config/scale.conf'.format(home)
inc = 0.0

def isconnected(device):
    ps = subprocess.Popen(['xrandr'], stdout=subprocess.PIPE)
    output = ps.stdout.read().decode('utf-8')
    for line in output.splitlines():
        if line.startswith('{} connected'.format(device)):
            return True
    return False

def isfloat(value):
  try:
    float(value)
    return True
  except ValueError:
    return False

if len(sys.argv) > 1:
    inc = float(sys.argv[1])

with open(conf_path, 'a+'): pass

with open(conf_path, 'r+') as file:
    scale = file.read().replace('\n', '')
    if (isfloat(scale) or scale.isnumeric()):
        scale = min(max(float(scale) + inc, 1.0), 2.5)
    else:
        scale = 2.0

with open(conf_path, 'w+') as file:
    file.write(str(scale))

# out1 = 'eDP1'
# out2 = 'DP1'
out1 = 'eDP-1-1'
out2 = 'DP-1-1'
# out1 = 'eDP-1'
# out2 = 'DP-1'
out1_size = (3000, 2000)
out2_size = (1920, 1200)
matrix = '{}00000,00000000,0.000000,\
         0.000000,{}00000,0.000000,\
         0.000000,0.000000,1.000000'.format(scale, scale)
# offsetX = 0 
# offsetY = -int(scale*out2_size[1])

screensize = (int(scale * (out1_size[0] + out2_size[0])), int(scale * (out1_size[1] + out2_size[1])))

if not isconnected(out2):
    p = ['xrandr',
            '--output', out1, 
            '--primary',
            '--auto',
            '--output', out2,
            '--off']
else:
    p = ['xrandr',
            '--fb', '{}x{}'.format(screensize[0], screensize[1]),
            '--output', out1, 
            '--mode', '{}x{}'.format(out1_size[0], out1_size[1]),
            # '--pos', '{}x{}'.format(int(scale*out2_size[0] + offsetX), int(scale*out2_size[1] + offsetY)),
            '--pos', '{}x{}'.format(int(scale*out2_size[0]), 0),
            '--rate', '60.00',
            '--output', out2, '--primary',
            '--mode', '{}x{}'.format(out2_size[0], out2_size[1]),
            '--rate', '59.95',
            '--transform', matrix
            ]

subprocess.run(p)


# Reload wallpaper
p = ['feh',
        '--bg-scale',
        '{}/Pictures/backgrounds/warty-final-ubuntu.png'.format(home)
        ]
subprocess.run(p)

