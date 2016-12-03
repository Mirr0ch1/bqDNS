#!/bin/bash

echo '|-------------------Configuring--------------------|'
echo '|..........rewrite the configuration file..........|'
echo '|--------------------------------------------------|'

opkg update
opkg install curl -y
rm -f /etc/dnsmasq.conf
touch /etc/dnsmasq.conf
echo "no-resolv" > /etc/dnsmasq.conf
echo "no-poll" >> /etc/dnsmasq.conf
echo "server=8.8.8.8" >> /etc/dnsmasq.conf
echo "server=8.8.4.4" >> /etc/dnsmasq.conf
echo "conf-dir=/etc/dnsmasq.d" >> /etc/dnsmasq.conf
mkdir /etc/dnsmasq.d
cd /etc/dnsmasq.d
curl -O -k https://raw.githubusercontent.com/Mirr0ch1/bqDNS/master/bin/accchina.conf
curl -O -k https://raw.githubusercontent.com/Mirr0ch1/bqDNS/master/bin/modified.conf
cd

echo '|--------------------------------------------------|'
echo '|............restarting dnsmasq service............|'
echo '|--------------------------------------------------|'

/etc/init.d/dnsmasq restart

echo '|-------------------COMPLETE-----------------------|'
echo '|      The script was finish.Please Check!         |'
echo '| bqDNS Project :https://github.com/Mirr0ch1/bqDNS |'
echo '|      Thanks to molin1987 s PandaDNS Project      |'
echo '|-------------------ENJOY IT!----------------------|'

rm -f bqdns-openwrt.sh
