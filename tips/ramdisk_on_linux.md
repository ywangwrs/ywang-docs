# How to Easily Create RAM Disk in Linux

## Reference:
https://www.linuxbabe.com/command-line/create-ramdisk-linux

## Create:
sudo mkdir /mnt/ramdisk
sudo chmod 777 /mnt/ramdisk

## Mount:
### Manual:
sudo mount -t tmpfs -o size=5g myramdisk /mnt/ramdisk

### Auto:
sudo nano /etc/fstab
myramdisk  /mnt/ramdisk  tmpfs  defaults,size=5G,x-gvfs-show  0  0

## Unmount:
sudo umount /mnt/ramdisk/

## Test speed:
sudo dd if=/dev/zero of=/mnt/ramdisk/zero bs=4k count=10000
sudo dd if=/mnt/ramdisk/zero of=/dev/null bs=4k count=10000
