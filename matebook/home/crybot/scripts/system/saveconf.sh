#!/bin/bash

# if [ $# -ne 1 ]; then
# 	echo "usage: saveconf <file>"
# 	exit 1
# fi

args=("$@")

for ((i=0; i < $#; i++))
do
  cp -r --parents `realpath ${args[$i]}` /home/crybot/dot-files/matebook/
done

