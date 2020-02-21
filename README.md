# RPI BTLE reader for LYWSD03MMC temperature and humedity sensor

`$ sh btle_LYWSD03MMC.sh [LYWSD03MMC_device_mac] [room-location] [hass_folder_to_be_exported]`

> Example: hass_folder_to_be_exported=/home/user/hass/config/www/sensors


# In HASS https://www.home-assistant.io/

## Create the sensor like this:

```yml
sensor:

  - platform: command_line
    command: cat /config/www/sensors/[room-location]_LYWSD03MMC_temperature
    name: Room temperature
    unit_of_measurement: "°C"

  - platform: command_line
    command: cat /config/www/sensors/[room-location]_LYWSD03MMC_humedity
    name: Room humedity
    unit_of_measurement: "%"

```

# Device
https://github.com/asanchez156/btle_LYWSD03MMC_reader/blob/master/device.png

```
