# Pidgin: How to setup notification of new IRC message

## Plugin:
 *  https://github.com/tymm/command-execute/

## Install gxmessage
gxmessage supports sending popup message to different X11 Display.
```
sudo apt-get install gxmessage
```

## Setup pop up message in "command-execute" plugin
```
gxmessage -nofocus -borderless -timeout 5 "New IRC message!" -display :1
```

