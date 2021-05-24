#!/bin/sh
if [ $# -ne 1 ]; then
  echo "usage: mount-shield <mount-point>"
  exit 1
fi

mount.cifs //192.168.1.59/Maxtor $1 -o username=marco.pampaloni1,pass="leafy-gush-army",uid=crybot,gid=users,rw
