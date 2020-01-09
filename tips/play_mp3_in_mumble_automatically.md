# How to automatically play sound in Mumble

## Install mumble from Ubuntu 18.04
```bash
sudo apt install mumble
```

## Setup sound setting in Mumble
### Reference
  * https://www.onetransistor.eu/2017/10/virtual-audio-cable-in-linux-ubuntu.html
  * https://www.youtube.com/watch?v=sZvwbX5YNWs
  
### Setting
  * Run these commands to setup the 'loopback' audio virtual device
  ```bash
  snap install pulseaudio
  pacmd load-module module-null-sink sink_name=Virtual_Sink sink_properties=device.description=Virtual_Sink
  ```
  * And then the sound setting in system looks like:
  * Inside mumble make the settings like the following

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
