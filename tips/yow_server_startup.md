# YOW server start up

## Mount network drives
```
sudo mount -t cifs -o username={username},password={password},uid=$(id -u),gid=$(id -g) //192.168.2.13/goflex\ home\ public/ /mnt/goflex/
```
