# Power/Battery Status
bat=$(( `cat /sys/class/power_supply/BAT0/energy_now` * 100 / `cat /sys/class/power_supply/BAT0/energy_full` ));
if [ "$( cat /sys/class/power_supply/AC0/online )" -eq "1" ]; then
  DWM_BATTERY="AC $bat";
  DWM_RENEW_INT=0.05;
else
  DWM_BATTERY=$bat;
  DWM_RENEW_INT=30;
fi;

# Wi-Fi eSSID
if [ "$( /sbin/iwgetid -r)" != "" ]; then
  DWM_ESSID=$( /sbin/iwgetid -r ); 
else
  DWM_ESSID="OFF";
fi;

# Volume Level
DWM_VOL=$( amixer -c1 sget Master | awk -vORS=' ' '/Mono:/ {print($6$4)}' );

# Date and Time
DWM_CLOCK=$( date '+%e %b %Y %a | %k:%M' );

# Overall output command
DWM_STATUS="WiFi: [$DWM_ESSID] | Power: [$DWM_BATTERY%] | Vol: $DWM_VOL | $DWM_CLOCK";
xsetroot -name "$DWM_STATUS";
sleep $DWM_RENEW_INT;

