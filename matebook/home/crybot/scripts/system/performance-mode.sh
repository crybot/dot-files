#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

cpupower frequency-set -g performance &&
cpupower frequency-set --max 4GHz &&
compton -CGb --config ~/.config/compton/compton.conf &&
xbacklight -set 50


