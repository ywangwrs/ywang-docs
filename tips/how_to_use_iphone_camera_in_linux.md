# How To Use iPhone as Computer's Camera (Ubuntu)
 
## Reference
 * http://riematrix.github.io/iphone-as-ros-camera-node/
 * https://ubuntuforums.org/showthread.php?t=2092935
 * https://steemit.com/technology/@tech.ninja/tech-quickie-convert-your-ipad-iphone-into-a-good-wireless-webcam-in-linux

## iPhone App
 * IPCampera

## Ubuntu 18.04 or 20.04 or Mint 19.x
```
sudo apt-get install v4l2loopback-dkms v4l-utils
sudo modprobe v4l2loopback
v4l2-ctl --list-devices
gst-launch-1.0 souphttpsrc location=http://192.168.2.36:80/live ! jpegdec ! videoconvert ! v4l2sink device=/dev/video0
```
