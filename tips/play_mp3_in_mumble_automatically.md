# How to automatically play sound in Mumble

## Install mumble from Ubuntu
## Setup sound setting in Mumble
## Play mp3 file from command
## Setup crontab to play mp3 file automatically
### Commands to check crontab log
```bash
grep CRON /var/log/syslog
```
### Command to check user mail
```bash
cat /var/mail/lpdtest
```
### crontab setting
```bash
55 04 * * * export XDG_RUNTIME_DIR=/run/user/1000 && /usr/bin/mpg321 ~/Music/fzn15.mp3
55 11 * * * export XDG_RUNTIME_DIR=/run/user/1000 && /usr/bin/mpg321 ~/Music/fzn15.mp3
55 16 * * * export XDG_RUNTIME_DIR=/run/user/1000 && /usr/bin/mpg321 ~/Music/fzn15.mp3
55 22 * * * export XDG_RUNTIME_DIR=/run/user/1000 && /usr/bin/mpg321 ~/Music/fzn15.mp3
```
