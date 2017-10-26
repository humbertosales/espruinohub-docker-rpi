#!/bin/bash

#WORKAROUND TO LISTEN BLUETOOTH INSIDE CONTAINER DOCKER.
#Ideas:
#https://github.com/rtruxal
#https://github.com/moby/moby/issues/16208#issuecomment-161770118

# Let's take a look at what rfkill's got goin on.  #If you have other connections like a wireless LAN, they might show up here. 
rfkill list

#so tell rfkill to unblock bluetooth nah
rfkill unblock bluetooth
# reset the adapter quick
hciconfig hci0 reset
#list devices and status
hciconfig dev

#call start espruinoHUB
while true
do
	echo "Executing start.sh infinite.... Press [CTRL+C] to stop..."
	./start.sh
done
