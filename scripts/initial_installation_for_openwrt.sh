#!/bin/bash
echo "Starting the installation of the basic set"
sleep 2
opkg update&&
opkg install \
  mc \
  nano \
  lumimqtt \
  mpd-full \
  mosquitto-nossl \
  node \
  node-zigbee2mqtt \
  sshpass \
  libssh \
  libssh2-1 \
  openssh-sftp-client \
  openssh-client-utils \
  luci-theme-bootstrap \
  htop

sleep 2

python3-pymysql

echo "Packages are installed"
sleep 2
echo "Adding configuration entries to zigbee2mqtt"
sleep 2
sed -i 's/port: 8080/port: 8090/' /etc/zigbee2mqtt/configuration.yaml
sed -i 's/homeassistant: false/homeassistant: true/' /etc/zigbee2mqtt/configuration.yaml
echo "Configuration entries in zigbee2mqtt have been added"
sleep 2
echo "Downloading the configuration file lumimqtt.json"
wget https://raw.githubusercontent.com/DivanX10/Openwrt-scripts-for-gateway-zhwg11lm/main/configuration%20files/lumimqtt.json -O /etc/lumimqtt.json&&
echo "Done"
sleep 2
echo "Setting up MPD"
mkdir -p /mpd/music /mpd/playlists /backup&&
touch /mpd/database /mpd/state&&
wget https://raw.githubusercontent.com/DivanX10/Openwrt-scripts-for-gateway-zhwg11lm/main/configuration%20files/mpd.conf -O /etc/mpd.conf&&
echo "Done"
sleep 2
echo "The installation of the basic set is completed, after 10 seconds the gateway will reboot"
sleep 10
reboot
