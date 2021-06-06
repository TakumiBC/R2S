#!/bin/sh
#By: Topsy Chen (thomaswcy)
#Licensed to the public under GPL General Public License 2.0
echo "Welcome to the RubikWrt NanoPi R2S Update Script (WAN/LAN Stable Firmware)"
echo "Downloading the latest release of WAN/LAN stable firmware"
wget -P /tmp https://github.com/thomaswcy/R2S/releases/download/$(date +%Y.%m.%d)-R2Swan&lan_stable/openwrt-rockchip-armv8-friendlyarm_nanopi-r2s-ext4-sysupgrade.img.gz
echo "Extracting Files"
cd /tmp/
unzip openwrt-rockchip-armv8-friendlyarm_nanopi-r2s-ext4-sysupgrade.img.gz
cd /
echo "Ready to reboot for updating after 3 seconds"
sleep 3s
sysupgrade /tmp/openwrt-rockchip-armv8-friendlyarm_nanopi-r2s-ext4-sysupgrade.img