#!/usr/bin/sh

cd /etc/dnsmasq.d
rm -f accchina.conf
rm -f modified.conf
wget https://raw.githubusercontent.com/Mirr0ch1/bqDNS/master/bin/accchina.conf
wget https://raw.githubusercontent.com/Mirr0ch1/bqDNS/master/bin/modified.conf
cd

echo "|----Process complete----|"
