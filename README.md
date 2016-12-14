# bqDNS
 一个轻量级的去污DNS计划
 为了做到全平台兼容，选择了DNSmasq作为服务器，同时避免了使用bind9会创建一个新域，导致国内应用被解析到国外CDN的尴尬
 基本上属于自用，所以如果有看ticket不及时的话还请谅解，Debian 7 / 8，Ubuntu 14.04 / 16.04，CentOS 6 / 7，OpenWRT 14.10 / 15.05实测可用

# 注意
* 因为DNS污染是根据国际端口进行的，所以VPS一定要**位于中国大陆境内**
* 国内域名使用疼讯DNS（`119.29.29.29`）进行解析，其他除指定地址列表（`modified.conf`）之外的地址均由GoogleDNS和OpenDNS进行解析
* 日常使用建议配合SS+GFWlist
* `modified.conf`内域名部分重定向到SNI-Proxy进行转发，SNI反向代理服务器收集自网络，如有不适请放弃
* 因国内大部分VPS访问AWS会有速度偏慢的情况，所以脚本执行时会将`raw.githubusercontent.com`定向到香港HKCB-SNI，进程结束后会自动恢复

# 安装方法（Root Required）
## Ubuntu (12.04 / 14.04 / 16.04) / Debian (7 / 8)
`wget https://raw.githubusercontent.com/Mirr0ch1/bqDNS/master/bqdns-ubuntu.sh --no-check-certificate && bash bqdns-ubuntu.sh`

## CentOS (6 / 7)
`wget https://raw.githubusercontent.com/Mirr0ch1/bqDNS/master/bqdns-centos.sh --no-check-certificate && bash bqdns-centos.sh`

## OpenWRT (14.07 or later)
`wget https://raw.githubusercontent.com/Mirr0ch1/bqDNS/master/bqdns-openwrt.sh --no-check-certificate && sh bqdns-openwrt.sh`

# 更新域名记录配置文件
`wget https://raw.githubusercontent.com/Mirr0ch1/bqDNS/master/update_dns_records.sh --no-check-certificate && bash update_dns_records.sh`

# 感谢名单
@GFWList @GoogleHosts @PandaDNS ……
