# Mount remote folder with sshfs

## Reference:
 *  https://www.digitalocean.com/community/tutorials/how-to-use-sshfs-to-mount-remote-file-systems-over-ssh

 1. sudo apt-get install sshfs
 2. sudo mkdir /mnt/droplet <--replace "droplet" whatever you prefer
 3. sudo sshfs -o allow_other,defer_permissions root@xxx.xxx.xxx.xxx:/ /mnt/droplet
   or:
   sudo sshfs -o allow_other,defer_permissions,IdentityFile=~/.ssh/id_rsa root@xxx.xxx.xxx.xxx:/ /mnt/droplet


## Mount with sshfs and write file permissions:
 *  Reference:
    * https://unix.stackexchange.com/questions/222944/mount-with-sshfs-and-write-file-permissions

 1. sudo chmod 644 /etc/fuse.conf
 2. added user_allow_other to /etc/fuse.conf
 3. not use sudo to run sshfs
 4. not use both the options default_permissions and allow_other
 5. sudo chown \<user\>:\<group\> /mnt/<mount_dir>

 *  command line looks like:
    ```
    sshfs -o IdentityFile=~/.ssh/id_rsa <user>@<server>:/path/to/your/folder /mnt/<mount_dir>
    ```
## Unmount
```
fusermount -u /mnt/<mount_dir>
```
