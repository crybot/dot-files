#!/bin/bash

path=~/.config/.performance_mode

if test ! -f $path; then
	echo "setting performance mode"
	echo "performance" > $path
fi

if [ $(<$path) == "performance" ]; then
	notify-send -i /home/crybot/Downloads/battery.png -t 3000 "performance mode enabled" -u normal
	/usr/local/bin/performance-mode
else
	notify-send -i /home/crybot/Downloads/battery.png -t 3000 "powersave mode enabled" -u low
	/usr/local/bin/powersave-mode
fi

exit 0

