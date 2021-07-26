# discord_ping_notify
When the latency is high, send the notification.

總而言之很簡單，通常是會加到Crontab中每幾分鐘偵測一次

寫這個，主要只是為了[Not.A.Free.Host](https://notafree.host)

![](https://github.com/kangjwme/discord_ping_notify/blob/main/ex.png?raw=true)


# 使用方法
1. 把這main.sh丟到/root資料夾中
2. 新增CornJob，輸入 `crontab -e` 後直接按下enter，在最底部新增

```
*/3 * * * * bash /root/main.sh
```
之後等待2-3分鐘cornjob生效就好了唷！
