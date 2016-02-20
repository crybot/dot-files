xrandr --output DVI-I-2 --auto --right-of HDMI-0
sudo ip link set enp3s0 up
sudo systemctl start dhcpcd.service
xrdb -merge ~/.Xresources

while true; do
  ~/.toolbar.sh
done &

xset -dpms
xset s off

while true; do
    # Log stderror to a file 
    dwm 2> ~/.dwm.log
    # No error logging
    #dwm >/dev/null 2>&1
done

#export EDITOR=vim &

#exec dwm

