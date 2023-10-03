#!/bin/bash

ETC='/opt/key-networks/ztncui/etc'
if [ -f ${ETC}/passwd ]; then
  echo "Password file aready exists"
else
  echo "Copying default password file..."
  cp -pv ${ETC}/default.passwd ${ETC}/passwd
fi
echo "Enabling and starting ztncui service..."
systemctl enable ztncui
systemctl start ztncui
