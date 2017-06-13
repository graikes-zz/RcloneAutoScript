#!/bin/bash

# Variables

#PID
PIDFILE=

#Rclone transfer type
TYPE=

#Rclone source dir
SOURCE=

#Rclone dest dir
DEST=

#Rclone option flags
OPT1=
OPT2=
OPT3=
OPT4=
OPT5=



# Check if PID file exists, if it does, check it's valid, and if not create new
if [ -f $PIDFILE ]
then
  PID=$(cat $PIDFILE)
  ps -p $PID > /dev/null 2>&1
  if [ $? -eq 0 ]
  then
    echo "Rclone sync already running"
    exit 1
  else
    ## If process not found assume not running
    echo $$ > $PIDFILE
    if [ $? -ne 0 ]
    then
      echo "Unable to create PID file"
      exit 1
    fi
  fi
else
  echo $$ > $PIDFILE
  if [ $? -ne 0 ]
  then
    echo "Unable to create PID file"
    exit 1
  fi
fi

# Run the sync job
rclone $TYPE "$SOURCE" "$DEST" $OPT1 $OPT2 $OPT3 $OPT4 -v

# Remove the PID file
rm $PIDFILE



