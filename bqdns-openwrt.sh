#!/bin/bash

echo '|-------------------Configuring--------------------|'
echo '|..........rewrite the configuration file..........|'
echo '|--------------------------------------------------|'

opkg update
opkg install curl
rm -f /etc/dnsmasq.conf
mv /etc/hosts /etc/hosts.bak
echo "218.254.1.15  raw.githubusercontent.com" > /etc/hosts
echo "no-resolv" > /etc/dnsmasq.conf
echo "no-poll" >> /etc/dnsmasq.conf
echo "server=8.8.8.8" >> /etc/dnsmasq.conf
echo "server=208.67.222.220" >> /etc/dnsmasq.conf
echo "conf-dir=/etc/dnsmasq.d" >> /etc/dnsmasq.conf
rm -rf /etc/dnsmasq.d
mkdir /etc/dnsmasq.d
cd /etc/dnsmasq.d
curl -O -k https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/accelerated-domains.china.conf
mv accelerated-domains.china.conf accchina.conf
curl -O -k https://raw.githubusercontent.com/racaljk/hosts/master/dnsmasq.conf
mv dnsmasq.conf modified.conf
cd

echo '|-----------------Final Treatments-----------------|'
echo '|............restarting dnsmasq service............|'
echo '|--------------------------------------------------|'
rm -f /etc/hosts
mv /etc/hosts.bak /etc/hosts
/etc/init.d/dnsmasq restart

echo '|-------------------COMPLETE-----------------------|'
echo '|      The script was finish.Please Check!         |'
echo '| bqDNS Project :https://github.com/Mirr0ch1/bqDNS |'
echo '|      Thanks to molin1987 s PandaDNS Project      |'
echo '|-------------------ENJOY IT!----------------------|'

rm -f bqdns-openwrt.sh
