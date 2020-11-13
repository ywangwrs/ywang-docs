# Resolve the SSL Version Mismatch error in latest Mumble

## How to install latest Mumble
 * Reference: https://wiki.mumble.info/wiki/Installing_Mumble
 * Commands
 ```
 sudo add-apt-repository ppa:mumble/release
 sudo apt-get update
 sudo apt list -a mumble
 sudo apt install mumble=<listed version from above command>
 ```
 
## Fix the "SSL Version Mismatch" error
 * Reference: 
   * https://www.reddit.com/r/mumble/comments/gtxo3r/ssl_version_mismatch_error_when_trying_to_connect/
   * https://bugs.launchpad.net/ubuntu/+source/gnutls28/+bug/1856428/comments/2
   
 * Create a config file /home/ywang/.config/mumble/openssl.cnf, with this content
 ```
openssl_conf = openssl_init

[openssl_init]
ssl_conf = ssl_sect

[ssl_sect]
system_default = system_default_sect

[system_default_sect]
CipherString = DEFAULT@SECLEVEL=1
 ```
 
 * Command
 ```
 OPENSSL_CONF=/home/ywang/.config/mumble/openssl.cnf /usr/bin/mumble
 ```

## How to change the command of a favorite icon in Ubuntu
* Create a bash file /home/ywang/.config/mumble/start_mumble.sh with this content
```
#!/bin/bash

OPENSSL_CONF=/home/ywang/.config/mumble/openssl.cnf /usr/bin/mumble
```
* Change content of this file:
```
sudo vi /usr/share/applications/mumble.desktop
```
Change the *Exec=* line to:
```
Exec=/home/ywang/.config/mumble/start_mumble.sh
```
