#!/bin/bash
while true;
do
  echo "Loop"
  sh $PERSONAL_PROJECTS_LOCATION/btle_LYWSD03MMC_reader/btle_LYWSD03MMC.sh $ANDONI_MAC_TERMO andoni $HASS_SENSORS_FOLDER
  sh $PERSONAL_PROJECTS_LOCATION/btle_LYWSD03MMC_reader/btle_LYWSD03MMC.sh $PRINCIPAL_MAC_TERMO principal $HASS_SENSORS_FOLDER
  sleep 60
done
