# Ubuntu: Shortcut to Connect/Disconnect a Bluetooth Device

## Commands
```
$ bluetoothctl devices
Device 00:0D:44:9E:BF:14 UE Mobile Boombox
Device F1:12:3B:CF:B4:7D AirPods

$ bluetoothctl disconnect F1:12:3B:CF:B4:7D
Attempting to disconnect from F1:12:3B:CF:B4:7D
Successful disconnected

$ bluetoothctl connect F1:12:3B:CF:B4:7D
Attempting to connect to F1:12:3B:CF:B4:7D
[CHG] Device F1:12:3B:CF:B4:7D Connected: yes
Connection successful
```

## Create shortcuts for commands
1. Open Settings => Keyboard Shortcuts
2. Click '+' from the bottom
3. Add 'Name', 'Command' and 'Shortcut' and then click Add button
