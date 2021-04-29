#!/bin/sh
cd /etc/overture
ls
chmod +x update-list.sh
./update-list.sh
/etc/init.d/overture restart