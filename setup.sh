#!/bin/bash
# Script to set up Raspberry Pi to br a CUPS printer server for a USB-connected Brother HL-2142 printer
# Run as 
#  sudo setup.sh
# or something like
#  sudo source <(curl -s https://raw.githubusercontent.com/aesidau/brother-server/main/setup.sh)
apt-get update
apt-get upgrade -y
apt-get install -y printer-driver-brlaser cups samba
usermod -aG lpadmin pi
/etc/init.d/cups start
cupsctl --remote-any
#/etc/init.d/cups restart
service cups restart
cd /home/pi
echo '0 * * * * /usr/bin/curl https://www.aes.id.au/myip/set.php?address=`/usr/bin/curl "http://www.ip-api.com/line/?fields=query"`' > crontab.txt
crontab -u pi crontab.txt 
