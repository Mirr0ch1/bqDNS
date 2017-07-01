#!/bin/bash
echo '|-------------------Installing---------------------|'
echo '|            dnsmasq openssl bind-utils            |'
echo '|--------------------------------------------------|'

apt-get update
apt-get remove iptables -y
apt-get upgrade -y
apt-get install dnsmasq curl -y
service dnsmasq stop

echo '|-------------------Configure----------------------|'
echo '|..........rewrite the configuration file..........|'
echo '|--------------------------------------------------|'


rm -f /etc/dnsmasq.conf
mv /etc/hosts /etc/hosts.bak
echo "218.254.1.15  raw.githubusercontent.com" > /etc/hosts
echo "no-resolv" > /etc/dnsmasq.conf
echo "no-poll" >> /etc/dnsmasq.conf
echo "server=8.8.8.8" >> /etc/dnsmasq.conf
echo "server=208.67.222.220" >> /etc/dnsmasq.conf
echo "no-dhcp-interface=eth0" >> /etc/dnsmasq.conf
echo "no-dhcp-interface=eth1" >> /etc/dnsmasq.conf
echo "conf-dir=/etc/dnsmasq.d" >> /etc/dnsmasq.conf
rm -rf /etc/dnsmasq.d
mkdir /etc/dnsmasq.d
cd /etc/dnsmasq.d
curl -O -k https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/accelerated-domains.china.conf
mv accelerated-domains.china.conf accchina.conf
curl -O -k https://raw.githubusercontent.com/racaljk/hosts/master/dnsmasq.conf
mv dnsmasq.conf modified.conf
cd


echo '|-----------------Final treatment------------------|'
echo '|--------Set SELinux and turn firewall off---------|'
echo '|--------------------------------------------------|'
service dnsmasq start
rm -f /etc/hosts
mv /etc/hosts.bak /etc/hosts

echo '|-------------------COMPLETE-----------------------|'
echo '|      The script was finish.Please Check!         |'
echo '| bqDNS Project :https://github.com/Mirr0ch1/bqDNS |'
echo '| credit: molin1987, racaljk, ChinaList, et cetra  |'
echo '|-------------------ENJOY IT!----------------------|'

rm -f bqdns-ubuntu.sh
