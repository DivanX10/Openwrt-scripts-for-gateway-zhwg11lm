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
sed -i 's/panel_iframe:/#panel_iframe:/' /etc/homeassistant/configuration.yaml
sed -i 's/configurator/#configurator/' /etc/homeassistant/configuration.yaml
sed -i 's/title: Configurator/#title: Configurator/' /etc/homeassistant/configuration.yaml
sed -i 's/icon: mdi:square-edit-outline/#icon: mdi:square-edit-outline/' /etc/homeassistant/configuration.yaml
sed -r -i 's/([^#])?url: (.*:3218)$/\1#url: \2/' /etc/homeassistant/configuration.yaml
sleep 2
echo "Done. Hass configurator removed."
sleep 2
echo "the home assistant will restart in 10 seconds."
sleep 10
/etc/init.d/homeassistant restart
exit
