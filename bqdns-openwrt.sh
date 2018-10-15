#!/bin/bash

echo '|-------------------Configuring--------------------|'
echo '|..........rewrite the configuration file..........|'
echo '|--------------------------------------------------|'

opkg update
opkg install curl
rm -f /etc/dnsmasq.conf
echo "no-resolv" > /etc/dnsmasq.conf
echo "no-poll" >> /etc/dnsmasq.conf
echo "server=1.0.0.1" >> /etc/dnsmasq.conf
echo "server=8.8.8.8" >> /etc/dnsmasq.conf
echo "server=208.67.222.220" >> /etc/dnsmasq.conf
echo "conf-dir=/etc/dnsmasq.d" >> /etc/dnsmasq.conf
rm -rf /etc/dnsmasq.d
mkdir /etc/dnsmasq.d
cd /etc/dnsmasq.d
curl -O -k https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/accelerated-domains.china.conf
mv accelerated-domains.china.conf accchina.conf
curl -O -k https://github.com/googlehosts/hosts/raw/master/hosts-files/dnsmasq.conf
mv dnsmasq.conf modified.conf
curl -O -k https://github.com/felixonmars/dnsmasq-china-list/raw/master/apple.china.conf
mv apple.china.conf apple.conf
cd

echo '|-----------------Final Treatments-----------------|'
echo '|............restarting dnsmasq service............|'
echo '|--------------------------------------------------|'
/etc/init.d/dnsmasq restart

echo '|-------------------COMPLETE-----------------------|'
echo '|      The script was finish.Please Check!         |'
echo '| bqDNS Project :https://github.com/Mirr0ch1/bqDNS |'
echo '| credit: molin1987, racaljk, ChinaList, et cetra  |'
echo '|-------------------ENJOY IT!----------------------|'

rm -f bqdns-openwrt.sh
