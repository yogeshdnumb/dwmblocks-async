#!/bin/dash

case $BLOCK_BUTTON in
1) wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle ;;
4) wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+ ;;
5) wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%- ;;
3) notify-send "📢 Volume module" "\- Shows volume 🔊, 🔇 if muted.
- Middle click to mute.
- Scroll to change." ;;
esac

vol="$(wpctl get-volume @DEFAULT_AUDIO_SINK@)"

[ "$vol" != "${vol%\[MUTED\]}" ] && echo "^B2^   ^d^  xx" && exit

vol="${vol#Volume: }"

split() {
	# For ommiting the . without calling and external program.
	IFS=$2
	set -- $1
	printf '%s' "$@"
}

vol="$(printf "%.0f" "$(split "$vol" ".")")"

case 1 in
	$((vol >= 50)) ) icon="   " ;;
	$((vol >= 1)) ) icon="   " ;;
	* ) echo "^B2^   ^d^ 00%" && exit ;;
esac

echo "^B1^${icon}^d^ ${vol}%"

