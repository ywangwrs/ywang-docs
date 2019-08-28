# How to use GPG to encrypt password

## Install GPG
```bash
sudo apt-get install gnupg2 -y
```

## Setup GPG key
```bash
gpg2 --list-keys
gpg --gen-key
```
You will see something like this after `gpg --gen-key`, and remember the key:
```
gpg: key AAA9DSACD551563BC marked as ultimately trusted
```
> **Note:** If this `agent_genkey failed: Timeout` error popped up, run t `rm -rf ~/.gnupg` command to fix it.

## Create a password file in ~/.mutt/myapsswd

Its content is:
```
set imap_pass = 'your password'
```

## Encrypt the password
```
cd ~/.mutt
gpg -r your.email@themailserver.com -e mypasswd
```
Now you can see a **myapsswd.gpg** generated. Now remove the text file:
```
shred mypasswd
rm -f mypasswd
```

## Use GPG command to replace password setting in ~/.muttrc

Remove `set imap_pass = 'your password'` from ~/.muttrc, and add this line to replace it:
```
source "gpg --passphrase <GPG key> -d ~/.mutt/mypasswd.gpg |"
```
