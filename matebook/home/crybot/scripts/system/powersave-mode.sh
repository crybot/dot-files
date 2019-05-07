#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

cpupower frequency-set -g powersave &&
cpupower frequency-set --max 2GHz
