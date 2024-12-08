这个是用于AdguardHome dns的相关设置，步骤：<br>

1.设置 AdguardHome里的Bootstrap DNS 服务器：<br>

  https://101.101.101.101/dns-query<br>
  https://45.125.0.26/dns-query<br>
  https://103.2.57.6/dns-query<br>
  https://101.101.101.101/dns-query<br>
  https://8.8.4.4/dns-query<br>
  https://104.16.248.249/dns-query<br>
  https://185.222.222.222/dns-query<br>
  https://208.67.220.220/dns-query<br>
  https://208.67.222.222/dns-query<br>

2.启用EDNS客户端子网<br>

3.拦截模式选择：自定义ip<br>
  127.0.0.1<br>
  ::1<br>
4.勾选乐观缓存<br>
5.yaml文件内字段设置并保存：<br> 
  upstream_dns_file: /usr/share/adguardhome.upstream<br>

6.以上步骤，作为首次使用AdguardHome的初次设置<br>

7.以下内容可作为定期执行的脚本:<br>
 以下命令用于更新cdn为最新github文件<br>
 
 curl https://purge.jsdelivr.net/busymilk/AdguardHomeSetting/refs/heads/master/dns_for_default<br>
 curl https://purge.jsdelivr.net/busymilk/AdguardHomeSetting/refs/heads/master/dns_for_special<br>
 curl https://purge.jsdelivr.net/felixonmars/dnsmasq-china-list/refs/heads/master/accelerated-domains.china.conf<br>
 curl https://purge.jsdelivr.net/busymilk/AdguardHomeSetting/refs/heads/master/dns_only_for_china.conf<br>
 curl https://purge.jsdelivr.net/busymilk/AdguardHomeSetting/refs/heads/master/upstream.sh<br>

 以下命令用来执行最新脚本<br>
 curl https://cdn.jsdelivr.net/busymilk/AdguardHomeSetting/refs/heads/master/upstream.sh | bash<br>

  

 
 


