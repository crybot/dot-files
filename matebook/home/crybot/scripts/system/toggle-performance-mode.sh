#!/bin/bash

path=~/.config/.performance_mode

if test -f $path; then
	if [ $(<$path) == "performance" ]; then
		echo "setting powersave mode"
		echo "powersave" > $path
	elif [ $(<$path) == "powersave" ]; then
		echo "setting performance mode"
		echo "performance" > $path
	else 
		echo "setting performance mode"
		echo "performance" > $path
	fi
else
	echo "setting performance mode"
	echo "performance" > $path
fi

if [ $(<$path) == "performance" ]; then
	notify-send -i ~/Downloads/battery.png -t 3000 "performance mode enabled" -u normal
	/usr/local/bin/performance-mode
else
	notify-send -i ~/Downloads/battery.png -t 3000 "powersave mode enabled" -u low
	/usr/local/bin/powersave-mode
fi

