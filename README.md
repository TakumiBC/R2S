```
    
  ____        _     _ _   __        __    _   
 |  _ \ _   _| |__ (_) | _\ \      / / __| |_ 
 | |_) | | | | '_ \| | |/ /\ \ /\ / / '__| __|
 |  _ <| |_| | |_) | |   <  \ V  V /| |  | |_ 
 |_| \_\\__,_|_.__/|_|_|\_\  \_/\_/ |_|   \__|
  W I R E L E S S   F R E E D O M
                                              
 ```

- 爱发电：http://afdian.net/@thomaswcy/plan/
----------------------------------------------------------------------------------------
- 下载地址：https://github.com/thomaswcy/R2S/releases
---------------------
- 版本区分
- Stable 稳定版：非常精简，互换网口
- Canary Beta 测试版：包含所有插件，互换网口
-------------------------------------------
下载文件
- openwrt-rockchip-armv8-friendlyarm_nanopi-r2s-squashfs-sysupgrade.img.gz（推荐小白使用）
- openwrt-rockchip-armv8-friendlyarm_nanopi-r2s-ext4-sysupgrade.img.gz（推荐大佬使用）
请在解压后使用
- MacOS请使用[Etcher](https://www.balena.io/etcher/)将固件写入TF卡
- Windows请使用[Rufus](https://rufus.ie/)将固件写入TF卡
------------------------------------------------------------
默认编译

- 后台ip：192.168.2.1
- 用户名：root
- 密码：password

--------------------------------------------------------------------------------------------------------------------------------
更新日志
- 2021.7.23
- 移除全新的argon主题
- 回归经典蓝色主题material
- 新增RubikWrt SSH登录界面 ascii
- 修复diapatcher.lua:469登录界面报错

-----------------------------------------
更新模块

测试版固件更新（在TYDD终端输入👇并回车）
```
wget -O - https://raw.githubusercontent.com/thomaswcy/R2S/main/scripts/update_beta.sh && sh update_beta.sh
```
稳定版固件更新（在TYDD终端输入👇并回车）
```
wget -O - https://raw.githubusercontent.com/thomaswcy/R2S/main/scripts/update_stable.sh && sh update_stable.sh
```
互换版固件更新（在TYDD终端输入👇并回车）
```
wget -O - https://raw.githubusercontent.com/thomaswcy/R2S/main/scripts/update_swap.sh && sh update_swap.sh
```
---------------------------------------
- Telegram群组：https://t.me/RubikWrtChat/
- Telegram频道：https://t.me/RubikWrt/
