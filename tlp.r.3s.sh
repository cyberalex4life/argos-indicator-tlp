#!/usr/bin/env bash
run_as_root="pkroot -d" # gksu; pkroot; gnomesu -c;
status=$(tlp stat -s  | grep Mode | awk '{ print $3 }' | tr [:lower:] [:upper:] )
ac_icon="battery-full-charging-symbolic"
battery_icon="battery-symbolic"
get_status_icon_name(){
	if [ "$status" = "BATTERY" ]
	then
        echo $battery_icon
	elif [  "$status" = "AC" ]
	then
		echo $ac_icon
	fi
}

_tlp="$(which tlp)"
_tlp_ac="$_tlp ac"
_tlp_bat="$_tlp bat"
tlp_ac="\"$run_as_root \\\"$_tlp_ac\\\"\""
tlp_bat="\"$run_as_root \\\"$_tlp_bat\\\"\""


active_mode_icon=$(get_status_icon_name)

status=$(tlp stat -s  | grep Mode | awk '{ print $3 }' | tr [:lower:] [:upper:] )
governor_status=$(cpupower frequency-info  -p | grep -o -P '(?<=").*(?=")')
echo "| iconName=$active_mode_icon"
echo "---"
echo "TLP Mode:"
echo "$status | terminal=false iconName=$active_mode_icon"
echo "---"
echo "On Power | iconName=$ac_icon bash=$tlp_ac terminal=false"
echo "On Battery | iconName=$battery_icon bash=$tlp_bat  terminal=false"
