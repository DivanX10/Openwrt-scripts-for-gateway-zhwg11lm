#Downgrade the OpenWRT on the Aqara ZHWG11LM gateway from 21.02 to 19.07
#Script for downgrade OpenWRT from version 21.02 to 19.07 by @Divan
#!/bin/sh
cd /tmp
echo "Starting the OpenWRT downgrade procedure from version 21.02 to 19.07"
sleep 2
wget https://openlumi.github.io/releases/19.07.7/targets/imx6/generic/openlumi-19.07.7-imx6-lumi-squashfs-sysupgrade.bin -O /tmp/openlumi-19.07.7-imx6-lumi-squashfs-sysupgrade.bin&&
echo "The files are downloaded to the tmp folder. Done"
sleep 2
echo "Replace model marks to allow upgrade with new files"
sleep 2
sed -i "/gw,imx6dl-gw51xx.*/a \\\\txiaomi,gateway-lumi |\\\\" /lib/upgrade/platform.sh&&
sed -i 's/aqara,zhwg11lm/xiaomi,gateway-lumi/' /tmp/board.json&&
sed -i 's/xiaomi,dgnwg05lm/xiaomi,gateway-lumi/' /tmp/board.json&&
sed -i 's/aqara,zhwg11lm/xiaomi,gateway-lumi/' /tmp/sysinfo/board_name&&
sed -i 's/xiaomi,dgnwg05lm/xiaomi,gateway-lumi/' /tmp/sysinfo/board_name&&
echo "Replace Done"
sleep 5
echo "Starting run sysupgrade in console"
sleep 2
sysupgrade -n -v openlumi-19.07.7-imx6-lumi-squashfs-sysupgrade.bin&&
echo "Sysupgrade Done"
exit
