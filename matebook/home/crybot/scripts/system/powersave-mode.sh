#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Set the powersave cpu governor and scale down clock frequencies
cpupower frequency-set -g powersave &&
cpupower frequency-set --max 2.0GHz &&

# Change energy performance hints to power.
# Available hints are (in order of increasing power saving) : performance, balance_performance, balance_power, power
sed -i 's/CPU_HWP_ON_AC=.*/CPU_HWP_ON_AC=balance_power/g' /etc/default/tlp.dpkg-dist &&
sed -i 's/CPU_HWP_ON_BAT=.*/CPU_HWP_ON_BAT=balance_power/g' /etc/default/tlp.dpkg-dist &&

# Start tlp
tlp start &&

# Disable window transparency by killing the composition manager (compton)
killall compton

# Auto tune power usage with powertop
powertop --auto-tune &

# Dim backlight
# xbacklight -set 50
