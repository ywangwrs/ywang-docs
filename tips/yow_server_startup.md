# YOW server start up

## Mount network drives
```
sudo mount -t cifs -o username={username},password={password},uid=$(id -u),gid=$(id -g) //192.168.2.13/goflex\ home\ public/ /mnt/goflex/
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

## Restart mongo-express docker
