#!/bin/bash
set -e

DATE=`date '+%T'`

dns_default='https://raw.githubusercontent.com/busymilk/AdguardHomeSetting/refs/heads/main/dns_for_default'
dns_special='https://raw.githubusercontent.com/busymilk/AdguardHomeSetting/refs/heads/main/dns_for_special'
dns_only_for_china='https://raw.githubusercontent.com/busymilk/AdguardHomeSetting/refs/heads/main/dns_only_for_china.conf'
domains_china_list='https://raw.githubusercontent.com/felixonmars/dnsmasq-china-list/refs/heads/master/accelerated-domains.china.conf'

if [ -z "$1" ]; then
  echo "使用原生链接raw.githubusercontent.com进行下载"
else
  echo "使用$1替换raw.githubusercontent.com进行下载"
  dns_default=$(echo $dns_default | sed "s/raw.githubusercontent.com/$1/g")
  dns_special=$(echo $dns_special | sed "s/raw.githubusercontent.com/$1/g")
  dns_only_for_china=$(echo $dns_only_for_china | sed "s/raw.githubusercontent.com/$1/g")
  domains_china_list=$(echo $domains_china_list | sed "s/raw.githubusercontent.com/$1/g")
fi

echo $dns_default
echo $dns_special
echo $dns_only_for_china
echo $domains_china_list


echo "$DATE: Getting data updates...1"
curl -o "/tmp/default.upstream" $dns_default > /dev/null 2>&1

echo "$DATE: Getting data updates...2"
curl -o "/tmp/special.upstream" $dns_special > /dev/null 2>&1


echo "$DATE: Getting data updates...3"
curl -o /tmp/chinalist.upstream $domains_china_list

echo "$DATE: Processing data format...4"
cat "/tmp/default.upstream" "/tmp/special.upstream" "/tmp/chinalist.upstream" > /usr/share/adguardhome.upstream
sed -i  "s|server=|[|g" /usr/share/adguardhome.upstream
sed -i  "s|/114|/]114|g" /usr/share/adguardhome.upstream

response=$(curl -s $dns_only_for_china)
sed -i "s|114.114.114.114|$response|g" /usr/share/adguardhome.upstream

echo "$DATE: Cleaning...5"
rm /tmp/*.upstream

echo "$DATE: Restarting AdGuardHome service..."
AdGuardHome -s restart
echo "$DATE: All finished!"
