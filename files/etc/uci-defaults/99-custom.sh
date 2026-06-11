#!/bin/sh


# 设置主机名映射，解决安卓原生 TV 无法联网的问题
uci add dhcp domain
uci set "dhcp.@domain[-1].name=time.android.com"
uci set "dhcp.@domain[-1].ip=203.107.6.88"

uci set network.lan.ipaddr='192.168.255.254'
uci set network.lan.netmask='255.255.255.0'

uci set wireless.@wifi-device[0].disabled='0'
uci set wireless.@wifi-device[1].disabled='0'

uci set wireless.@wifi-iface[0].ssid='AX3000M_2G'
uci set wireless.@wifi-iface[1].ssid='AX3000M_5G'


pppoe_username="1"
pppoe_password="1"

uci commit network
uci commit wireless

/etc/init.d/network restart
wifi reload

# 设置编译作者信息
FILE_PATH="/etc/openwrt_release"
NEW_DESCRIPTION="Compiled by cheng"
sed -i "s/DISTRIB_DESCRIPTION='[^']*'/DISTRIB_DESCRIPTION='$NEW_DESCRIPTION'/" "$FILE_PATH"




exit 0
