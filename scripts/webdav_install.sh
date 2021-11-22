#!/bin/sh
# WebDav installer script by @Clear_Highway

echo "================================================"
echo " Installing WebDav and mounting your Yandex disk"
echo "================================================"

read -p 'Username: ' ya_disk
read -sp 'Password: ' ya_pass

DIR="/mnt/$ya_disk"
if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  echo "****"
  echo "Error WebDav $ya_disk exist?"
  echo "Clear the configuration:"
  echo "rmdir -p /mnt/$ya_disk"
  echo "rm -f /etc/davfs2/secrets"
  echo "and restart the installation"
  echo "or connect another Yandex disk."
  exit 1
else
  ###  Control will jump here if $DIR does NOT exists ###
  mkdir -p /mnt/$ya_disk
  echo "****"
  echo 'Update opkg list and install davfs2'
  opkg update >/dev/null
  opkg install davfs2 >/dev/null
  echo 'Mounting your Yandex disk'
  date +"https://webdav.yandex.ru  $ya_disk $ya_pass" >> /etc/davfs2/secrets
  chmod 600 /etc/davfs2/secrets
  mkdir -p /mnt/$ya_disk
  mount.davfs https://webdav.yandex.ru /mnt/$ya_disk
fi
df -h /mnt/$ya_disk
du -h /mnt/$ya_disk
echo "=================================================="
echo Yandex Disk $ya_disk mounted in your device
echo "=================================================="
echo "Done."
