#!/bin/sh
#By: Topsy Chen (thomaswcy)
#Licensed to the public under GPL General Public License 2.0
opkg update
opkg install pv
opkg install gzip
cd /tmp
rm -rf artifact openwrt-rockchip*.img.gz openwrt-rockchip*img*
echo -e '\e[92m准备下载固件\e[0m'
wget https://github.com/thomaswcy/R2S/releases/download/$(date +%Y.%m.%d)-R2Sbeta/openwrt-rockchip-armv8-friendlyarm_nanopi-r2s-ext4-sysupgrade.img.gz
if [ -f /tmp/openwrt-rockchip-armv8-friendlyarm_nanopi-r2s-ext4-sysupgrade.img.gz	]; then
	echo -e '\e[92m最新固件已下载，准备解压\e[0m'
else
	wget https://github.com/thomaswcy/R2S/releases/download/$(date -d "@$(( $(busybox date +%s) - 86400))" +%Y.%m.%d)-R2Sbeta/openwrt-rockchip-armv8-friendlyarm_nanopi-r2s-ext4-sysupgrade.img.gz
	if [ -f /tmp/openwrt-rockchip-armv8-friendlyarm_nanopi-r4s-ext4-sysupgrade.img.gz ]; then
		echo -e '\e[92m昨天的固件已下载，准备解压\e[0m'
	else
		echo -e '\e[91m没找到固件，明天再试试吧\e[0m'
		exit 1
	fi
fi
cd /tmp
echo -e '\e[92m准备解压镜像文件\e[0m'
pv openwrt-rockchip-armv8-friendlyarm_nanopi-r2s-ext4-sysupgrade.img.gz | gunzip -dc > openwrt-rockchip-armv8-friendlyarm_nanopi-r2s-ext4-sysupgrade.img
if [ -f /tmp/openwrt-rockchip-armv8-friendlyarm_nanopi-r2s-ext4-sysupgrade.img	]; then
	echo -e '\e[92m删除已下载文件\e[0m'
	rm -rf openwrt-rockchip-armv8-friendlyarm_nanopi-r2s-ext4-sysupgrade.img.gz
fi
echo -e '\e[92m开始升级固件\e[0m'
sleep 3s
sysupgrade -v /tmp/openwrt-rockchip-armv8-friendlyarm_nanopi-r2s-ext4-sysupgrade.img