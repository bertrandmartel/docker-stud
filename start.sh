#!/bin/bash

DEFAULT_PEM_FILE="/usr/local/etc/stud/stud.pem"
DEFAULT_FRONTEND="[*]:6984"
DEFAULT_BACKEND="[127.0.0.1]:5984"
DEFAULT_SSL=on
DEFAULT_WORKERS=2

if [ ! -z "$CONFIG_PATH" ]; then

	echo "------------------------------------"	
	echo "--------- Launching STUD -----------"
	echo "------------------------------------"
	echo "| CONFIG_PATH  |  $CONFIG_PATH      "
	echo "------------------------------------"

	stud  --config $CONFIG_PATH
else
	
	CONFIG=""

	if [ -z "$PEM_FILE" ]; then
		PEM_FILE="$DEFAULT_PEM_FILE"
	fi

	CONFIG="$CONFIG $DEFAULT_PEM_FILE"

	if [ -z "$FRONTEND" ]; then
		FRONTEND="$DEFAULT_FRONTEND"
	fi

	CONFIG="$CONFIG --frontend=$FRONTEND"

	if [ -z "$BACKEND" ]; then
		BACKEND="$DEFAULT_BACKEND"
	fi

	CONFIG="$CONFIG --backend=$BACKEND"

	if [ -z "$SSL" ]; then
		SSL="$DEFAULT_SSL"
	fi

	if [ "$SSL" == "on" ]; then
		CONFIG="$CONFIG --ssl"
	fi

	if [ -z "$WORKERS" ]; then
		WORKERS="$DEFAULT_WORKERS"
	fi

	CONFIG="$CONFIG --workers=$WORKERS"

	echo "------------------------------------"	
	echo "--------- Launching STUD -----------"
	echo "------------------------------------"
	echo "| PEM_FILE  |  $PEM_FILE            "
	echo "| FRONTEND  |  $FRONTEND            "
	echo "| BACKEND   |  $BACKEND             "
	echo "| SSL       |  $SSL                 "
	echo "| WORKERS   |  $WORKERS             "
	echo "------------------------------------"

	stud  $CONFIG
fi