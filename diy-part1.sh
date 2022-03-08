#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

## 常用OpenWrt软件包源码合集，同步上游更新！
## 通用版luci适合18.06与19.07
# echo 'src-git small8 https://github.com/kenzok8/small-package' >>feeds.conf.default


## 解除系统限制
ulimit -u 10000
ulimit -n 4096
ulimit -d unlimited
ulimit -m unlimited
ulimit -s unlimited
ulimit -t unlimited
ulimit -v unlimited

## 检查服务器信息

echo -e "-------------- ------------CPU信息------------------------------------------\n"
echo "CPU物理数量:$(cat /proc/cpuinfo| grep "physical id"| sort| uniq| wc -l)"

echo -e "CPU核心及版本信息：$(cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c) \n"

echo "-------------------------------内存信息-------------------------------------------"

echo "已安装内存详细信息："
sudo lshw -short -C memory | grep GiB
echo -e "\n"

echo "-----------------------------硬盘信息---------------------------------------------"
echo -e  "硬盘数量：$(ls /dev/sd* | grep -v [1-9] | wc -l) \n"

df -Th
