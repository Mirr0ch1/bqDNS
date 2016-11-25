# bqDNS
一个轻量级的去污DNS计划
最早我在使用zyqf的PandaDNS，然而使用过程中渐渐发现问题：国内网站解析到美国，手动修改记录困难，所以我准备自己用Dnsmasq做一个配置
纯自用，不见得会查看issues

# 注意
* 因为DNS污染是根据端口进行的，所以VPS一定要**位于中国大陆境内**
* 目前只有CentOS的一键配置脚本，其他非RHEL系的Linux请自己动手
* 国内域名使用疼讯DNS（`119.29.29.29`）进行解析，其他除指定地址列表（`modified.conf`）之外的地址均由`8.8.8.8`解析，所以污染在所难免，日常使用请配合SS+GFWList
* `modified.conf`内域名全部重定向到SNI-Proxy进行转发，SNI反向代理服务器收集自网络，如有不适请放弃。

# 安装方法（Root Required）
## CentOS (6 / 7)
`wget https://raw.githubusercontent.com/Mirr0ch1/bqDNS/master/bqdns-centos.sh --no-check-certificate && bash bqdns-centos.sh`
## OpenWRT (14.07 or later)
`wget https://raw.githubusercontent.com/Mirr0ch1/bqDNS/master/bqdns-openwrt.sh --no-check-certificate && bash bqdns-openwrt.sh`

# 更新域名记录配置文件
`wget https://raw.githubusercontent.com/Mirr0ch1/bqDNS/master/update_dns_records.sh --no-check-certificate && bash update_dns_records.sh`

# 感谢名单
太多辣
