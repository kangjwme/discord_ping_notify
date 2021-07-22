#!/bin/bash
# 這邊寫你的WebHook網址
export WEBHOOK_URL=""
# 這邊是你偵測對象的IP
export IP="168.95.1.1"
# 這邊只是來抓取延遲
export pingms=$(ping -c 10 $IP | grep 'min/avg/max/mdev' | awk '{print $4}' | cut -d '/' -f2)
# 這邊是設定延遲警告底線(ms)
export alert=200


# 當延遲超過指定職，發送數據
if [ $(echo | awk '{print int("'$pingms'"*1000)}') -gt $(echo "$alert * 1000" | bc) ] ; then
	curl -H "Content-Type: application/json" -d "{\"username\":\"網路延遲小精靈\",\"avatar_url\":\"https://thumbs.gfycat.com/ConventionalMiniatureHornedviper-max-1mb.gif\",\"content\":\"\",\"embeds\":[{\"color\":16721408,\"description\":\"德國節點(DE-1) 延遲超過警戒值( $alert ms )，目前為：**$pingms **ms\n期間內可能造成連線卡頓等問題，如果狀況持續請通知 <#864064415828541492>\",\"timestamp\":\"\",\"author\":{\"name\":\"\",\"url\":\"\",\"icon_url\":\"https://thumbs.gfycat.com/ConventionalMiniatureHornedviper-max-1mb.gif\"},\"image\":{\"url\":\"\"},\"thumbnail\":{\"url\":\"\"},\"footer\":{\"text\":\"\"},\"fields\":[]}],\"components\":[]}" $WEBHOOK_URL
fi
