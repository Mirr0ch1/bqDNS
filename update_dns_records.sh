#!/usr/bin/sh

cd /etc/dnsmasq.d
rm -f modified.conf
wget https://raw.githubusercontent.com/Mirr0ch1/bqDNS/master/bin/modified.conf
cd
service dnsmasq restart

echo "|----Process complete----|"

rm -f update_dns_records.sh
