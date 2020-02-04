#!/bin/bash
set -x
# dbus.sh &
exec "$@"
while true
do
	echo "Press [CTRL+C] to stop.."
	sleep 1
done
