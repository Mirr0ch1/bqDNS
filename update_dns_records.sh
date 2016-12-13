#!/usr/bin/sh

mv /etc/hosts /etc/hosts.bak
echo "218.254.1.15  raw.githubusercontent.com" > /etc/hosts
cd /etc/dnsmasq.d
rm -f modified.conf
curl -O -k https://raw.githubusercontent.com/Mirr0ch1/bqDNS/master/bin/modified.conf
cd
service dnsmasq restart

echo "|----Process complete----|"
rm -f /etc/hosts
mv /etc/hosts.bak /etc/hosts
rm -f update_dns_records.sh
