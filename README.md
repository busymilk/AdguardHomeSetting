这个是用于AdguardHome dns的相关设置，步骤：

1.设置 AdguardHome里的Bootstrap DNS 服务器：

  https://101.101.101.101/dns-query
  https://45.125.0.26/dns-query
  https://103.2.57.6/dns-query
  https://101.101.101.101/dns-query
  https://8.8.4.4/dns-query
  https://104.16.248.249/dns-query
  https://185.222.222.222/dns-query
  https://208.67.220.220/dns-query
  https://208.67.222.222/dns-query

2.启用EDNS客户端子网

3.拦截模式选择：自定义ip
  127.0.0.1
  ::1
4.勾选乐观缓存
5.yaml文件内字段设置并保存： upstream_dns_file: /usr/share/adguardhome.upstream


6.以上步骤，作为首次使用AdguardHome的初次设置

7.以下内容可作为定期执行的脚本:
 以下命令用于更新cdn为最新github文件
 
 curl https://purge.jsdelivr.net/busymilk/AdguardHomeSetting/refs/heads/master/dns_for_default
 curl https://purge.jsdelivr.net/busymilk/AdguardHomeSetting/refs/heads/master/dns_for_special
 curl https://purge.jsdelivr.net/felixonmars/dnsmasq-china-list/refs/heads/master/accelerated-domains.china.conf
 curl https://purge.jsdelivr.net/busymilk/AdguardHomeSetting/refs/heads/master/dns_only_for_china.conf
 curl https://purge.jsdelivr.net/busymilk/AdguardHomeSetting/refs/heads/master/upstream.sh

 以下命令用来执行最新脚本
 curl https://cdn.jsdelivr.net/busymilk/AdguardHomeSetting/refs/heads/master/upstream.sh | bash

  

 
 


