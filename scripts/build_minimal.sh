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

# Add luci-app-vssr <M>
git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb.git
git clone --depth=1 https://github.com/jerrykuku/luci-app-vssr

# Add luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
rm -rf ../lean/luci-theme-argon

# Mod zzz-default-settings
pushd package/lean/default-settings/files
sed -i '/http/d' zzz-default-settings
export orig_version="$(cat "zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')"
sed -i "s/${orig_version}/${orig_version} ($(date +"%Y.%m.%d"))/g" zzz-default-settings
popd

# Change default shell to zsh
sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.1/g' package/base-files/files/bin/config_generate
sed -i '/uci commit system/i\uci set system.@system[0].hostname='RubikWrt'' package/lean/default-settings/files/zzz-default-settings
sed -i "s/OpenWrt /thomaswcy build $(TZ=UTC-8 date "+%Y.%m.%d") @ RubikWrt /g" package/lean/default-settings/files/zzz-default-settings
# sed -i "s/FILES:=$(LINUX_DIR)/net/can/can-dev.ko/FILES:=$(LINUX_DIR)/drivers/net/can/dev/can-dev.ko \ package/kernel/linux/modules/can.mk

# Custom configs
# git am $GITHUB_WORKSPACE/patches/lean/*.patch
echo -e " thomaswcy's RubikWrt built on "$(date +%Y.%m.%d)"\n -----------------------------------------------------" >> package/base-files/files/etc/banner
sed -i 's/<tr><td width="33%"><%:CPU usage (%)%></td><td id="cpuusage">-</td></tr>/<tr><td width="33%" <%:特别鸣谢%></td><td><a href="https://ap.hb48.tk//auth/register?code=JtoN">MaTrix    <a href="https://nf.run/WfgAzX">奈飞小铺    <a href="https://www.youtube.com/c/BIGdongdong/featured">BIG东东 </a></td></tr>' package/lean/autocore/files/index.htm
rm -rf banner
wget https://raw.githubusercontent.com/thomaswcy/R2S/main/banner
popd

# Add CUPInfo
pushd package/lean/autocore/files/arm/sbin
cp -f $GITHUB_WORKSPACE/scripts/cpuinfo cpuinfo
popd
