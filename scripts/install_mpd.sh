set -e
opkg update && opkg install mpd-full
mkdir -p /mpd/music /mpd/playlists
touch /mpd/state /mpd/database
wget https://raw.githubusercontent.com/DivanX10/Openwrt-scripts-for-gateway-zhwg11lm/main/configuration%20files/mpd.conf -O /etc/mpd.conf
echo "MPD is installed"
