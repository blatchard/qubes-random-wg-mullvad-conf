#!/bin/sh

#need check to see if interface is up and provide correct messages

w=$(wg show $"interfaces")

if [ $w ]; then
	echo -e '\nYou are connected to '$w'\nYou will now be connected to a new conf. '
	echo "Enter two char country code: "
	read coucode
	
	#need code to catch invalid inputs, it will accept 2 valid letters (country), blank or *
	STR="/rw/usrlocal/etc/wireguard/"
	confslist=($STR"mullvad-"$coucode*)
	echo ${#confslist[@]}
	wg-quick down $w
	wg-quick up ${confslist[RANDOM%${#confslist[@]}]};		
	
fi


