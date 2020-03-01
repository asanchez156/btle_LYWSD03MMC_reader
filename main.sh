#!/bin/bash

exec 1>/tmp/btle_LYWSD03MMC_reader.log 2>&1  # send stdout and stderr from this file to a log file
set -x

while true;
do
  echo "Loop"
  sh $PERSONAL_PROJECTS_LOCATION/btle_LYWSD03MMC_reader/btle_LYWSD03MMC.sh $ANDONI_MAC_TERMO andoni $HASS_SENSORS_FOLDER
  echo -n "Andoni finished:"
  date
  sh $PERSONAL_PROJECTS_LOCATION/btle_LYWSD03MMC_reader/btle_LYWSD03MMC.sh $PRINCIPAL_MAC_TERMO principal $HASS_SENSORS_FOLDER
  echo -n "Principal finished:"
  date
  sleep 300
done

