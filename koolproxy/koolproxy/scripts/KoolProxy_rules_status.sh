#!/bin/sh

alias echo_date1='echo $(date +%Y年%m月%d日\ %X)'
export KSROOT=/koolshare
source $KSROOT/scripts/base.sh
eval `dbus export koolproxy_`

version=`koolproxy -v`
status=`ps|grep -w koolproxy | grep -cv grep`
date=`echo_date1`
pid=`pidof koolproxy`

easylist_rules_local=`cat $KSROOT/koolproxy/data/rules/easylistchina.txt  | sed -n '3p'|awk '{print $3,$4}'`
easylist_nu_local=`grep -E -v "^!" $KSROOT/koolproxy/data/rules/easylistchina.txt | wc -l`
abx_rules_local=`cat $KSROOT/koolproxy/data/rules/chengfeng.txt  | sed -n '3p'|awk '{print $3,$4}'`
abx_nu_local=`grep -E -v "^!" $KSROOT/koolproxy/data/rules/chengfeng.txt | wc -l`
fanboy_rules_local=`cat $KSROOT/koolproxy/data/rules/fanboy.txt  | sed -n '4p'|awk '{print $3,$4}'`
fanboy_nu_local=`grep -E -v "^!" $KSROOT/koolproxy/data/rules/fanboy.txt | wc -l`

if [ "$koolproxy_easylist_rules" == "1" -o "$koolproxy_abx_rules" == "1" -o "$koolproxy_fanboy_rules" == "1" ]; then
	http_response "ABP规则：$easylist_rules_local / $easylist_nu_local条&nbsp;&nbsp;&nbsp;&nbsp;乘风规则：$abx_rules_local / $abx_nu_local条&nbsp;&nbsp;&nbsp;&nbsp;Fanboy规则：$fanboy_rules_local / $fanboy_nu_local条"
else
	http_response "<font color='#FF0000'>未加载！</font>"
fi


