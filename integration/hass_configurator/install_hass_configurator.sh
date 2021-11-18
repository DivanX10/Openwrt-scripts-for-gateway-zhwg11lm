#!/bin/bash

wget https://raw.githubusercontent.com/DivanX10/OpenWRT-and-Home-Assistant/main/requirements.txt -O /tmp/requirements.txt&&

python /etc/tmp/install_package.py

sleep 5
if [ -e /etc/init.d/hass-configurator ]
then
echo "The file exists, skip it"
else
echo "The file does not exist, so it is created"
touch /etc/init.d/hass-configurator 
fi

if grep "procd_set_param command hass-configurator -b /etc/homeassistant" /etc/init.d/hass-configurator;
then
echo "The file is not empty, we skip it"
else
echo "The file is empty, add the configuration"
cat > /etc/init.d/hass-configurator <<EOF
#!/bin/sh /etc/rc.common
START=99
USE_PROCD=1
start_service()
{
    procd_open_instance
    procd_set_param command hass-configurator -b /etc/homeassistant
    procd_set_param stdout 1
    procd_set_param stderr 1
    procd_close_instance
}
EOF

fi

chmod +x /etc/init.d/hass-configurator&&
/etc/init.d/hass-configurator enable&&
/etc/init.d/hass-configurator start&&
sleep 2
echo "Done. Hass configurator is installed."

