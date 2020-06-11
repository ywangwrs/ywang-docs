# How to automatically play sound in Mumble

## Install mumble (1.3 or above) from Ubuntu 18.04
  * Reference: https://wiki.mumble.info/wiki/Installing_Mumble#Linux
```bash
sudo apt install mumble
```

## Setup sound setting in Mumble
### Reference
  * https://www.onetransistor.eu/2017/10/virtual-audio-cable-in-linux-ubuntu.html
  * https://linuxhint.com/pulse_audio_sounds_ubuntu/
  * https://www.youtube.com/watch?v=sZvwbX5YNWs (Windows)
  
### Setting
  * Run these commands to setup the 'loopback' audio virtual device
  ```bash
  snap install pulseaudio pavucontrol
  pacmd load-module module-null-sink sink_name=Virtual_Sink sink_properties=device.description=Virtual_Sink
  ```
  
  * And then the sound setting in system looks like:
  <img src='https://user-images.githubusercontent.com/15996047/72033640-e5179a80-3260-11ea-93b8-98221052adb4.png'/>
  
  * Inside mumble make the settings like the following (**Quality should be better in 60 kb/s**)
  <img src='https://user-images.githubusercontent.com/15996047/72033713-14c6a280-3261-11ea-9314-5865a44e8e31.png'/>
  <img src='https://user-images.githubusercontent.com/15996047/72033714-14c6a280-3261-11ea-87f7-6992a212f630.png'/>
  <img src='https://user-images.githubusercontent.com/15996047/72033715-14c6a280-3261-11ea-9b51-802ff8dbdc9e.png'/>

## Play mp3 file from command line maunally
### Install mpg321
```bash
sudo apt install mpg321
```
### Command to play a mp3 file
```bash
mpg321 <mp3 file>
```

## Setup crontab to play mp3 file automatically
### Reference
  * https://askubuntu.com/questions/530048/ubuntu-14-04-and-playing-songs-from-cron

### Command to check crontab log
```bash
grep CRON /var/log/syslog
```
### Command to check user mail
```bash
cat /var/mail/lpdtest
```
### Command may be useful
```bash
sudo  usermod -aG audio <current user>
```
### crontab setting
```bash
55 05 * * * export XDG_RUNTIME_DIR=/run/user/1000 && /usr/bin/mpg321 ~/Music/fzn15.mp3
55 11 * * * export XDG_RUNTIME_DIR=/run/user/1000 && /usr/bin/mpg321 ~/Music/fzn15.mp3
55 17 * * * export XDG_RUNTIME_DIR=/run/user/1000 && /usr/bin/mpg321 ~/Music/fzn15.mp3
55 23 * * * export XDG_RUNTIME_DIR=/run/user/1000 && /usr/bin/mpg321 ~/Music/fzn15.mp3
```
