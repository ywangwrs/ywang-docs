# YOW server start up

## Mount network drives
```
sudo mount -t cifs -o username={username},password={password},uid=$(id -u),gid=$(id -g) //192.168.2.13/goflex\ home\ public/ /mnt/goflex/
```

## Start elasticsearch dockers
- When starting ES dockers, you may see this error which blocks all elasticsearch docker starts:
   > ERROR: [1] bootstrap checks failed

- Run the following command before running 'docker-compose up' will fix above issue:
```
sysctl -w vm.max_map_count=262144
```

## Fail to start winxp VM from virtualbox
- In this case, use the *headless* mode to start VMs, it doesn't show UI in VNC session, but can still log onto it through anydesk or teamviewer

## Change workqueue in RAM disk to 777
```
chmod 777 /mnt/ramdisk/workqueue
```
This will allow winxp VMs put their posts into Z:\

## Reinstall matt in tools docker

## Restart mongo-express docker