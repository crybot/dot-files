#!/bin/bash

if [ $# -ne 1 ]; then
	echo "usage: saveconf <file>"
	exit 1
fi

cp -r --parents `realpath $1` ~/dot-files/matebook/

