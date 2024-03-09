#!/bin/bash

# Check if the specified application is running
if pgrep -x "$1" >/dev/null; then
	# Reset the application
	pkill "$1"
	"$1" &
else
	echo "$1 is not running"
fi
