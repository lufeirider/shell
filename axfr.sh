#!/bin/bash
#nslookup -type=ns test.com
#dig @dns1.test.com axfr test.com
#usage:axfr.sh baidu.com
domain=$1
nsserver=`dig +short ns $domain`
echo -e "\033[33m$nsserver\033[0m"
for ns in $nsserver
do
	echo -e "\t正在与服务器$ns尝试区域传送..."
	ns=${ns:0:-1}
	echo -e "\tdomain=$domain   nsserver=@$ns"
	dig @$ns axfr $domain
done
