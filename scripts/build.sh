#!/bin/bash
starttime=`date +'%Y-%m-%d %H:%M:%S'`
cores=`expr $(nproc --all) + 1`

# down source
git clone https://github.com/openwrt/openwrt -b master --depth=1 && cd openwrt

# Update kernel tags
# git checkout include/kernel-version.mk
# curl -s https://www.cooluc.com/openwrt-5.10/0001-kernel-bump-5.10-to-latest.patch > 0001-kernel-bump-5.10-to-latest.patch
# git apply 0001-kernel-bump-5.10-to-latest.patch

./scripts/feeds update -a && ./scripts/feeds install -a

# scripts
wget https://www.cooluc.com/openwrt-5.10/scripts/00-prepare_5.10.sh
wget https://www.cooluc.com/openwrt-5.10/scripts/01-prepare_package.sh
wget https://www.cooluc.com/openwrt-5.10/scripts/02-remove_upx.sh
wget https://www.cooluc.com/openwrt-5.10/scripts/03-convert_translation.sh
wget https://www.cooluc.com/openwrt-5.10/scripts/04-create_acl_for_luci.sh
wget https://www.cooluc.com/openwrt-5.10/scripts/09_get_lean_package.sh
wget https://www.cooluc.com/openwrt-5.10/scripts/99_clean_build_cache.sh
chmod 0755 *sh
./00-prepare_5.10.sh
./01-prepare_package.sh
./02-remove_upx.sh
./04-create_acl_for_luci.sh -a
./09_get_lean_package.sh
./03-convert_translation.sh

# Drop uhttpd
pushd feeds/luci
curl -s https://www.cooluc.com/openwrt-5.10/0002-feeds-luci-Drop-uhttpd-depends.patch > 0002-feeds-luci-Drop-uhttpd-depends.patch
git apply 0002-feeds-luci-Drop-uhttpd-depends.patch && rm 0002-feeds-luci-Drop-uhttpd-depends.patch
popd

# Load r4s Config
curl -s https://www.cooluc.com/openwrt-5.10/github-actions-config > .config
make defconfig

# Compile
make download -j$cores
make toolchain/install -j$cores
make -j$cores

# Compile time
endtime=`date +'%Y-%m-%d %H:%M:%S'`
start_seconds=$(date --date="$starttime" +%s);
end_seconds=$(date --date="$endtime" +%s);
if [ -f bin/targets/rockchip/armv8/openwrt-rockchip-armv8-friendlyarm_nanopi-r4s-ext4-sysupgrade.img.gz ];then
    echo -e " \033[32m Build success! \033[0m"
    echo -e " Build time: \033[32m"$((end_seconds-start_seconds))"\033[0m s."
else
    echo -e " \033[31m Build error... \033[0m"
    echo -e " Build time: \033[32m"$((end_seconds-start_seconds))"\033[0m s."
fi
exit 0
