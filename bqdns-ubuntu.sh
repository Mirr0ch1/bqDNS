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
touch /etc/dnsmasq.conf
echo "218.254.1.15  raw.githubusercontent.com" >> /etc/hosts
echo "no-resolv" > /etc/dnsmasq.conf
echo "no-poll" >> /etc/dnsmasq.conf
echo "server=8.8.8.8" >> /etc/dnsmasq.conf
echo "server=208.67.222.220" >> /etc/dnsmasq.conf
echo "no-dhcp-interface=eth0" >> /etc/dnsmasq.conf
echo "no-dhcp-interface=eth1" >> /etc/dnsmasq.conf
echo "conf-dir=/etc/dnsmasq.d" >> /etc/dnsmasq.conf
cd /etc/dnsmasq.d
curl -O -k https://raw.githubusercontent.com/Mirr0ch1/bqDNS/master/bin/accchina.conf
curl -O -k https://raw.githubusercontent.com/Mirr0ch1/bqDNS/master/bin/modified.conf
cd


echo '|-----------------Final treatment------------------|'
echo '|--------Set SELinux and turn firewall off---------|'
echo '|--------------------------------------------------|'
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
service dnsmasq start

echo '|-------------------COMPLETE-----------------------|'
echo '|      The script was finish.Please Check!         |'
echo '| bqDNS Project :https://github.com/Mirr0ch1/bqDNS |'
echo '|      Thanks to molin1987 s PandaDNS Project      |'
echo '|-------------------ENJOY IT!----------------------|'

echo "127.0.0.1 localhost" > /etc/hosts
rm -f bqdns-ubuntu.sh
