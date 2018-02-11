# How to Install and Configure VNC on Ubuntu 16.04

## Reference

https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-vnc-on-ubuntu-16-04

## Steps

1. Install xfce4 and tightvncserver
    ```bash
    sudo apt-get update
    sudo apt install xfce4 xfce4-goodies tightvncserver
    ```

2. Use new .vnc/xstartup

    ```bash
    mv ~/.vnc/xstartup ~/.vnc/xstartup.bak
    ```

    Here is the new content of ~/.vnc/xstartup:

    ```bash
    #!/bin/bash
    xrdb $HOME/.Xresources
    startxfce4 &
    ```

    To ensure that the VNC server will be able to use this new startup file properly, we'll need to grant executable privileges to it.

    ```bash
    sudo chmod +x ~/.vnc/xstartup
    ```

3. Creating a VNC Service File

    First, create a new unit file called /etc/systemd/system/vncserver@.service using your favorite text editor:

    ```ini
    [Unit]
    Description=Start TightVNC server at startup
    After=syslog.target network.target

    [Service]
    Type=forking
    User=ywang
    PAMName=login
    PIDFile=/home/ywang/.vnc/%H:%i.pid
    ExecStartPre=-/usr/bin/vncserver -kill :%i > /dev/null 2>&1
    ExecStart=/usr/bin/vncserver -depth 24 -geometry 1280x800 :%i
    ExecStop=/usr/bin/vncserver -kill :%i

    [Install]
    WantedBy=multi-user.target
    ```

    And then , make the system aware of the new unit file and enable it.

    ```bash
    sudo systemctl daemon-reload
    sudo systemctl enable vncserver@1.service
    ```

    Finally, verify that it started with this command:

    ```bash
    sudo systemctl status vncserver@1
    ```

    If it started correctly, the output should look like this:

    ```log
    vncserver@1.service - TightVNC server on Ubuntu 16.04
    Loaded: loaded (/etc/systemd/system/vncserver@.service; enabled; vendor preset: enabled)
    Active: active (running) since Mon 2016-04-25 03:21:34 EDT; 6s ago
    Process: 2924 ExecStop=/usr/bin/vncserver -kill :%i (code=exited, status=0/SUCCESS)
    ...
    systemd[1]: Starting TightVNC server on Ubuntu 16.04...
    systemd[2938]: pam_unix(login:session): session opened for user finid by (uid=0)
    systemd[2949]: pam_unix(login:session): session opened for user finid by (uid=0)
    systemd[1]: Started TightVNC server on Ubuntu 16.04.
    ```

## Conclusion

You should now have a secured VNC server up and running on your Ubuntu 16.04 server. Now you'll be able to manage your files, software, and settings with an easy-to-use and familiar graphical interface.

