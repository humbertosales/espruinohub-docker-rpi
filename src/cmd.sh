#!/bin/bash



function log_info {
	echo -e $(date '+%Y-%m-%d %T')"\e[1;32m $@\e[0m"
}

function release_bluetooth_locked {
	#WORKAROUND TO LISTEN BLUETOOTH INSIDE CONTAINER DOCKER.
	#Ideas:
	#https://github.com/rtruxal
	#https://github.com/moby/moby/issues/16208#issuecomment-161770118
	
	log_info "Unlocking bluetooth RPI3..."

	# Let's take a look at what rfkill's got goin on.  #If you have other connections like a wireless LAN, they might show up here. 
	rfkill list

	#so tell rfkill to unblock bluetooth nah
	rfkill unblock bluetooth
	# reset the adapter quick
	hciconfig hci0 reset
	#list devices and status
	hciconfig dev

}

function start_espruino_hub {
	log_info "Starting espruino hub"
	./start.sh
}

function terminate_container {
  kill ${spid}
  stop_db2
  if [ $pid -ne 0 ]; then
    kill -SIGTERM "$pid"
    wait "$pid"
  fi
  log_info "espruino hub stopped"
  exit 0 # finally exit main handler script
}

trap "terminate_container"  SIGTERM

log_info "Initializing container..."
release_bluetooth_locked

while true
do
	start_espruino_hub
	export pid=${!}	
	sleep 1s &
	export spid=${!}
	wait $spid
done