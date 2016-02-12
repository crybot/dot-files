# Load .Xresources file
xrdb -merge ~/.Xresources

while true; do
  ~/.toolbar.sh
done &

# Make dwm restartable
while true; do
    # Log stderror to a file 
    dwm 2> ~/.dwm.log
    # No error logging
    #dwm >/dev/null 2>&1
done

# Set some defaults
export EDITOR=vim &

# Run dwm
exec dwm


