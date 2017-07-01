#!/usr/bin/sh

echo '|--------------------------------------------------|'
echo '|        update the dns records for dnsmasq        |'
echo '|        bqDNS project created by  Mirr0ch1        |'
echo '| credit: molin1987, racaljk, ChinaList, et cetra  |'
echo '|--------------------------------------------------|'
mv /etc/hosts /etc/hosts.bak
echo "218.254.1.15  raw.githubusercontent.com" > /etc/hosts
cd /etc/dnsmasq.d
rm -f accchina.conf
curl -O -k https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/master/accelerated-domains.china.conf
mv accelerated-domains.china.conf accchina.conf
rm -f modified.conf
curl -O -k https://raw.githubusercontent.com/racaljk/hosts/master/dnsmasq.conf
mv dnsmasq.conf modified.conf
cd
service dnsmasq restart

echo '|-----------------Process Complete-----------------|'
rm -f /etc/hosts
mv /etc/hosts.bak /etc/hosts
echo '|-----------------Final Treatments-----------------|'
rm -f update_dns_records.sh
