#!/bin/bash
echo '|-------------------Installing---------------------|'
echo '|            dnsmasq openssl bind-utils            |'
echo '|--------------------------------------------------|'

yum update -y
yum groupinstall "Development Tools" -y
yum install openssl bind-utils -y
yum groupinstall "Development Libraries" -y
yum install dnsmasq -y
service dnsmasq stop

echo '|-------------------Configure----------------------|'
echo '|..........rewrite the configuration file..........|'
echo '|--------------------------------------------------|'


rm -f /etc/dnsmasq.conf
touch /etc/dnsmasq.conf
echo "no-resolv" > /etc/dnsmasq.conf
echo "no-poll" >> /etc/dnsmasq.conf
echo "server=8.8.8.8" >> /etc/dnsmasq.conf
echo "server=8.8.4.4" >> /etc/dnsmasq.conf
echo "no-dhcp-interface=eth0" >> /etc/dnsmasq.conf
echo "no-dhcp-interface=eth1" >> /etc/dnsmasq.conf
echo "conf-dir=/etc/dnsmasq.d" >> /etc/dnsmasq.conf
cd /etc/dnsmasq.d
wget https://raw.githubusercontent.com/Mirr0ch1/bqDNS/master/bin/accchina.conf
wget https://raw.githubusercontent.com/Mirr0ch1/bqDNS/master/bin/modified.conf
cd


echo '|-----------------Final treatment------------------|'
echo '|--------Set SELinux and turn firewall off---------|'
echo '|--------------------------------------------------|'
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config
service firewalld stop
chkconfig firewalld off
service dnsmasq start
chkconfig dnsmasq on

echo '|-------------------COMPLETE-----------------------|'
echo '|      The script was finish.Please Check!         |'
echo '| bqDNS Project :https://github.com/Mirr0ch1/bqDNS |'
echo '|      Thanks to molin1987's PandaDNS Project      |
echo '|-------------------ENJOY IT!----------------------|'
