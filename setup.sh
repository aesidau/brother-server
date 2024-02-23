#!/bin/bash
# Script to set up Raspberry Pi to br a CUPS printer server for a USB-connected Brother HL-2142 printer
# Run as sudo setup.sh
apt-get update
apt-get upgrade -y
apt-get install -y printer-driver-brlaser cups
usermod -aG lpadmin pi
/etc/init.d/cups start
cupsctl --remote-any
#/etc/init.d/cups restart
service cups restart
