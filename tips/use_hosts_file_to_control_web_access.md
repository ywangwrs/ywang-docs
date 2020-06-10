# How to use /etc/hosts to control website accessibility

## Redirect a website access
 - For example, redirect test.hopto.org to an internal IP 192.168.x.x
 ```
 192.168.x.x    test.hopto.org
 ```

## Block accessing youtube
 - For example, blocking youtube.com
 ```
 127.0.0.1   https://www.youtube.com/
 ::1         https://www.youtube.com/
 127.0.0.1   http://www.youtube.com/
 ::1         http://www.youtube.com/
 127.0.0.1   www.youtube.com/
 ::1         www.youtube.com/
 127.0.0.1   youtube.com/
 ::1         youtube.com/
 ```
