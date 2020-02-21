#!/bin/bash

###############################################
## Auth: https://github.com/asanchez156
## Thanks to: 
## http://www.d0wn.com/using-bash-and-gatttool-to-get-readings-from-xiaomi-mijia-lywsd03mmc-temperature-humidity-sensor/
##
##
###############################################

mac=$1
room=$2
device_name="_LYWSD03MMC_"
location=$3

if [ ! -d "$location" ] 
then 
  echo "Error: Directory $location does not exists."
  exit 1
fi

bt=$(timeout 15 gatttool -b $mac --char-write-req --handle='0x0038' --value="0100" --listen)
if [ -z "$bt" ]
then
  echo "The reading for $room $mac failed. Retrying..."
  sh $PERSONAL_PROJECTS_LOCATION/btle_LYWSD03MMC_reader/btle_LYWSD03MMC.sh $mac $room $location
else
  echo "Got data for $room $mac"
  echo $bt

  ## Folder to export
  prefix=$(echo "$room$device_name")
  echo "Location folder: $location and prefix $prefix"


  ## Get hexadecimal values
  temphexa=$(echo $bt | awk -F ' ' '{print $12$11}'| tr [:lower:] [:upper:] )
  humhexa=$(echo $bt | awk -F ' ' '{print $13}'| tr [:lower:] [:upper:])

  ## Get decimal values
  temperature100=$(echo "ibase=16; $temphexa" | bc)
  humidity=$(echo "ibase=16; $humhexa" | bc)
  temperature=$(echo "scale=1; $temperature100/100" | bc)

  if [ -z "$temperature" ]
  then
    echo "There are no temperature values"
  else
    # Export to folder files
    echo -n $temperature > ${location}${prefix}temperature
    # Print sensor values
    echo "${location}${prefix}temperature $temperature"
  fi

  if [ -z "$humidity" ]
  then
    echo "There are no humidity values"
  else
    # Export to folder files
    echo -n $humidity > ${location}${prefix}humedity
    # Print sensor values
    echo "${location}${prefix}humedity $humidity"
  fi

fi

