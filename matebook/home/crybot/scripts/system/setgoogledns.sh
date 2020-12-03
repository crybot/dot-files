#!/bin/bash

if [ $EUID -ne 0 ]; then
  echo "Privilegi non sufficienti..."
  exit 1
fi

echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf
