# TAB does not automatically complete docker commands solution

## Reference
https://linuxconfig.org/tab-does-not-automatically-complete-docker-commands-solution

## Solution
Install/configure BASH completion (or your shell of choice). 
On Debian GNU/Linux this can be achieved with the following command

```
# apt-get install bash-completion
```

Open a new shell. If completion is still not functioning you may need to add (or uncomment) the following lines in /etc/bash.bashrc. Alternatively these lines can be added to any file that is sourced by your shell (i.e ~/bashrc, ~/bash_profile)

```
# enable bash completion in interactive shells
if ! shopt -oq posix; then
 if [ -f /usr/share/bash-completion/bash_completion ]; then
   . /usr/share/bash-completion/bash_completion
 elif [ -f /etc/bash_completion ]; then
   . /etc/bash_completion
 fi
fi
```

Debian package installed as above adds file /etc/bash_completion.d/docker. If you do not have this file you will need to download it and place it in /etc/bash_completion directory. You can find this file online using your favourite search engine and the search termsdocker completion gist
