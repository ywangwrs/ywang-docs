# YOW server start up

## Mount network drives
```
sudo mount -t cifs -o username={username},password={password},iocharset=utf8,file_mode=0777,dir_mode=0777,vers=1.0 '//192.168.2.42/GoFlex Home Public' /mnt/goflex/
```
or
```
sudo mount -t cifs //192.168.2.1/bak1 /mnt/backup/ -o vers=1.0,username=WORKGROUP\ywang,password=
```

## Fail to start winxp VM from virtualbox
- In this case, use the *headless* mode to start VMs, it doesn't show UI in VNC session, but can still log onto it through anydesk or teamviewer

## Change workqueue in RAM disk to 777
```
sudo chmod 777 /mnt/ramdisk/workqueue
```
This will allow winxp VMs put their posts into Z:\

## After tools docker started, run this command inside the docker to avoid the "the input device is not a TTY" issue
```
while true; do /tools/report_forums.sh && sleep 60; done
```

## Watch workqueue folde
```
cd /mnt/ramdisk/workqueue
while true; \
    do time=`date '+%Y-%m-%d %H:%M:%S'`; \
    if [ `date +%S` == 30 ] || [ `date +%S` == 31 ]; then 
        ls; \
    fi; \
    num=`ls -l | grep ^- | wc -l`; \
    echo -e "$time > \033[1;33m$num\033[0m"; \
    sleep 2; \
done
```
