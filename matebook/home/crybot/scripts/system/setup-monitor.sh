#!/bin/bash

RESX1=1920
RESY1=1200
RESX2=3000
RESY2=2000
SCALE=2

# 9840x6400 

# xrandr --dpi 259 --fb $(( 2 * (RESX1 + RESX2) ))x$(( 2 * (RESY1 + RESY2) )) \
#   --output eDP1 --mode "$RESX2"x"$RESY2" \
#   --output DP2 --scale 2x2 --pos "$RESX2"x0 \
#   --panning $(( RESX1 * 2 ))x$(( RESY1 * 2 ))+"$RESX2"+0

# autorandr version
# 3000x2000 + (offsetX*1.5)x(offsetY*1.5)
xrandr --fb 6055x5600 \
  --output DP1 --mode 1920x1200 --rate 59.95 \
  --transform 2.500000,00000000,0.000000,0.000000,2.500000,0.000000,0.000000,0.000000,1.000000 \
  --output eDP1 --primary --mode 3000x2000 --pos 3055x3600 --rate 60.00
