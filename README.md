# NanoPi R2S RubikWrt
- 下载地址：https://gihtub.com/thomaswcy/R2S/releases

版本区分

- Stable 稳定版：非常精简
- Canary Beta 测试版：包含所有插件

下载文件
- openwrt-rockchip-armv8-friendlyarm_nanopi-r2s-squashfs-sysupgrade.img.gz（推荐小白使用）
- openwrt-rockchip-armv8-friendlyarm_nanopi-r2s-ext4-sysupgrade.img.gz（推荐大佬使用）

------------------------------------------------------------
默认编译

- 后台ip：192.168.8.1
- 用户名：root
- 密码：password
-----------------------------------------------------
固件内置了KoolProxyR，若想使用请先在TYDD终端执行👇
```
wget -4 -O /tmp/KoolProxyR_install.sh https://shaoxia1991.coding.net/p/koolproxyr/d/koolproxyr/git/raw/master/KoolProxyR_install.sh && chmod 777 /tmp/KoolProxyR_install.sh && sh /tmp/KoolProxyR_install.sh
```

程序运行完毕后，即可在“服务”列表看到KoolProxyR了

---------------------------------------------------------------------------------------------------------------------------------

灰度测试功能 更新模块

测试版固件更新（在TYDD终端输入👇并回车）
```
wget https://raw.githubusercontent.com/thomaswcy/R2S/main/scripts/update_beta.sh
```
稳定版固件更新（在TYDD终端输入👇并回车）
```
wget https://raw.githubusercontent.com/thomaswcy/R2S/main/scripts/update_stable.sh
```
互换版固件更新（在TYDD终端输入👇并回车）
```
wget https://raw.githubusercontent.com/thomaswcy/R4S/main/scripts/update_swap.sh
```
---------------------------------------
- Telegram群组：https://t.me/RubikWrtChat/
- Telegram频道：https://t.me/RubikWrt/

---------------------------------------------------------------------------------------
捐赠作者
- 爱发电：http://afdian.net/@thomaswcy/plan/
