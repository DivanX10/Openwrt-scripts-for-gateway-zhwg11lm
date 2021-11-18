#!/bin/bash

if [ -e /etc/init.d/hass-configurator ]
then
echo "The hass-configurator is found and will be deleted"
/etc/init.d/hass-configurator stop&&
sleep 2
rm /etc/init.d/hass-configurator
else
echo "There is no hosts-configurator file, we skip it"
fi

sleep 2
pip uninstall hass-configurator -y&&
sleep 2
echo "Done. Hass configurator removed. Delete the configuration for hass-configurator from configuration.yml manually"

