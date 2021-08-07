#!/bin/bash

# Add luci-app-ssr-plus
pushd package/lean
git clone --depth=1 https://github.com/fw876/helloworld
popd

# Clone community packages to package/community
mkdir package/community
pushd package/community

# Add Lienol's Packages
git clone --depth=1 https://github.com/Lienol/openwrt-package
rm -rf ../lean/luci-app-kodexplorer

# Add luci-app-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall

# Add luci-app-vssr <M>
git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb.git
git clone --depth=1 https://github.com/jerrykuku/luci-app-vssr

# Add mentohust & luci-app-mentohust
git clone --depth=1 https://github.com/BoringCat/luci-app-mentohust
git clone --depth=1 https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk

# Add luci-proto-minieap
git clone --depth=1 https://github.com/ysc3839/luci-proto-minieap

# Add ServerChan
git clone --depth=1 https://github.com/tty228/luci-app-serverchan

# Add OpenClash
git clone --depth=1 -b master https://github.com/vernesong/OpenClash

# Add luci-app-onliner
git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner

# Add luci-app-diskman
git clone --depth=1 https://github.com/SuLingGG/luci-app-diskman
mkdir parted
cp luci-app-diskman/Parted.Makefile parted/Makefile

# Add luci-app-dockerman
rm -rf ../lean/luci-app-docker
git clone --depth=1 https://github.com/lisaac/luci-app-dockerman
git clone --depth=1 https://github.com/lisaac/luci-lib-docker

# Add luci-app-ddnsto
pushd package/network/services
git clone --depth=1 https://github.com/linkease/ddnsto-openwrt
popd

# Add luci-app-linkease
pushd package/network/services
git clone --depth=1 https://github.com/linkease/linkease-openwrt
popd

# Add luci-app-godproxy
git clone --depth=1 https://github.com/project-lede/luci-app-godproxy
sed -i 's/translate("GodProxy是基于KoolProxyR Plus+重新整理的能识别adblock规则的免费开源软件,追求体验更快、更清洁的网络，屏蔽烦人的广告！"))/translate("KoolProxyR Plus+是能识别AdBlock规则的免费开源软件,追求体验更快、更清洁的网络，屏蔽烦人的广告！"))' luci-app-godproxy/luasrc/model/cbi/koolproxy/global.lua
sed -i 's/msgstr "GodProxy滤广告"/msgstr "KoolProxy R Plus+"' luci-app-godproxy/po/zh-cn/koolproxy.po
sed -i 's/translate("GodProxy滤广告  运行中")/msgstr "translate("KoolProxy R Plus+  运行中")"' luci-app-godproxy/luasrc/view/koolproxy/koolproxy_status.htm
sed -i 's/translate("GodProxy滤广告")/msgstr "translate("KoolProxy R Plus+")' luci-app-godproxy/luasrc/model/cbi/koolproxy/rss_rule.lua
sed -i 's/GodProxy滤广告  未运行/KoolProxy R Plus+  未运行' luci-app-godproxy/luasrc/model/cbi/koolproxy/rss_rule.lua
sed -i 's/GodProxy滤广告  运行中/KoolProxy R Plus+  运行中' luci-app-godproxy/luasrc/model/cbi/koolproxy/rss_rule.lua

# Add luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
rm -rf ../lean/luci-theme-argon

# Add subconverter
git clone --depth=1 https://github.com/tindy2013/openwrt-subconverter

# Add luci-udptools
svn co https://github.com/zcy85611/Openwrt-Package/trunk/luci-udptools
svn co https://github.com/zcy85611/Openwrt-Package/trunk/udp2raw
svn co https://github.com/zcy85611/Openwrt-Package/trunk/udpspeeder-tunnel

# Add OpenAppFilter
git clone --depth=1 https://github.com/destan19/OpenAppFilter

# Add luci-app-oled
git clone --depth=1 https://github.com/NateLol/luci-app-oled

# Add extra wireless drivers
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl8812au-ac
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl8821cu
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl8188eu
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl8192du
svn co https://github.com/immortalwrt/immortalwrt/branches/openwrt-18.06-k5.4/package/kernel/rtl88x2bu

# Add apk (Apk Packages Manager)
svn co https://github.com/openwrt/packages/trunk/utils/apk
popd

# Mod zzz-default-settings
pushd package/lean/default-settings/files
sed -i '/http/d' zzz-default-settings
export orig_version="$(cat "zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')"
sed -i "s/${orig_version}/${orig_version} ($(date +"%Y-%m-%d"))/g" zzz-default-settings
popd

# Use Lienol's https-dns-proxy package
pushd feeds/packages/net
rm -rf https-dns-proxy
svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy
popd

# Use snapshots' syncthing package
pushd feeds/packages/utils
rm -rf syncthing
svn co https://github.com/openwrt/packages/trunk/utils/syncthing
popd

# Fix mt76 wireless driver
pushd package/kernel/mt76
sed -i '/mt7662u_rom_patch.bin/a\\techo mt76-usb disable_usb_sg=1 > $\(1\)\/etc\/modules.d\/mt76-usb' Makefile
popd

# Change default shell to zsh
sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd

# Swap LAN WAN  
sed -i 's,"eth1" "eth0","eth0" "eth1",g' target/linux/rockchip/armv8/base-files/etc/board.d/02_network  
sed -i "s,'eth1' 'eth0','eth0' 'eth1',g" target/linux/rockchip/armv8/base-files/etc/board.d/02_network

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
sed -i '/uci commit system/i\uci set system.@system[0].hostname='RubikWrt'' package/lean/default-settings/files/zzz-default-settings
sed -i "s/RubikWrt /thomaswcy build $(TZ=UTC-8 date "+%Y.%m.%d") @ RubikWrt /g" package/lean/default-settings/files/zzz-default-settings
sed -i '/127.0.0.1 localhost/a 192.168.2.1 www1.rubikwrt.com' package/base-files/files/etc/hosts

# Custom configs
git am $GITHUB_WORKSPACE/patches/*.patch
echo -e " thomaswcy's RubikWrt built on "$(date +%Y.%m.%d)"\n -----------------------------------------------------" >> package/base-files/files/etc/banner
sed -i '/Load Average/i\\t\t<tr><td width="33%"><%:特别鸣谢%> </td><td><a href="https://ap.hb48.tk//auth/register?code=JtoN">MaTrix    <a href="https://nf.run/WfgAzX">奈飞小铺    <a href="https://www.youtube.com/c/BIGdongdong/featured">BIG东东 </a></td></tr>' package/lean/autocore/files/index.htm
pushd package/base-files/files/etc/banner
rm -rf banner
wget https://raw.githubusercontent.com/thomaswcy/R2S/main/banner
popd

# Add CUPInfo
pushd package/lean/autocore/files/arm/sbin
cp -f $GITHUB_WORKSPACE/scripts/cpuinfo cpuinfo
popd
