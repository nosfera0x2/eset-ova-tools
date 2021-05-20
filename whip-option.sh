#!/bin/bash

option=$(
whiptail --title "ESET OVA TOOLS" --menu "Choose your option" 25 80 4 "1" "See Server Trace Log" "2" "Uninstall Web Console" "3" "Install Web Console" 3>&1 1>&2 2>&3
)

echo "Your option was $option"

if [ $option = 1 ]; then
	/root/eset-ova-tools/server-lynx.sh
else
	echo "no other options at this time"
fi









