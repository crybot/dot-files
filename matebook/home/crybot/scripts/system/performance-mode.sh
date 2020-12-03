#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Set the performance cpu governor and scale up clock frequencies
cpupower frequency-set -g performance &&
cpupower frequency-set --max 4GHz &&

# Change energy performance hints to performance.
# Available hints are (in order of increasing power saving) : performance, balance_performance, balance_power, power
sed -i 's/CPU_HWP_ON_AC=.*/CPU_HWP_ON_AC=performance/g' /etc/default/tlp.dpkg-dist &&
sed -i 's/CPU_HWP_ON_BAT=.*/CPU_HWP_ON_BAT=performance/g' /etc/default/tlp.dpkg-dist &&

# Restart the composition manager to enable transparency
killall compton 
compton -CGb --config /home/crybot/.config/compton/compton.conf &&

# Set backlight to a normal value
# xbacklight -set 70


