<h4>这个是用于AdguardHome dns的相关设置，步骤：</h4>
<h5>0.设置Dnsmasq监听端口号为0,设置yaml文件内监听端口为53</h5>
<h5>1.设置 AdguardHome里的Bootstrap DNS 服务器：</h5>

  https://101.101.101.101/dns-query<br>
  https://45.125.0.26/dns-query<br>
  https://103.2.57.6/dns-query<br>
  https://101.101.101.101/dns-query<br>
  https://8.8.4.4/dns-query<br>
  https://104.16.248.249/dns-query<br>
  https://185.222.222.222/dns-query<br>
  https://208.67.220.220/dns-query<br>
  https://208.67.222.222/dns-query<br>

<h5>2.启用EDNS客户端子网</h5>

<h5>3.拦截模式选择：自定义ip</h5>
  127.0.0.1<br>
  ::1<br>
<h5>4.勾选乐观缓存</h5>
<h5>5.yaml文件内字段设置并保存：</h5>

  upstream_dns_file: /usr/share/adguardhome.upstream

<h5>6.以上步骤，作为首次使用AdguardHome的初次设置</h5>

<h5>7.以下内容可作为定期执行的脚本:</h5>
 curl https://raw.githubusercontent.com/busymilk/AdguardHomeSetting/refs/heads/main/upstream.sh | bash<br>
 or<br>
 curl https://raw.gitmirror.com/busymilk/AdguardHomeSetting/refs/heads/main/upstream.sh | bash raw.gitmirror.com
  

 
 


