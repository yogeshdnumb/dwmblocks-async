#!/bin/dash

case $BLOCK_BUTTON in
1) notify-send "This Month" "$(cal | sed "s/\<$(date +'%e' | sed 's/ //g')\>/<b><span color='red'>&<\/span><\/b>/")" ;;
3) notify-send "Appointments" "$(calcurse -d3)" ;;
esac

date "+^B1^   ^d^ %a,%d"
