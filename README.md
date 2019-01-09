## INFO

Script for testing if BLOCd daemon is running. If it's not running, it will start the BLOCd daemon.

Idea taken from https://superuser.com/a/685444/124884


## SETUP

The script needs to be put as a cronjob that runs every minute.

```
cd ~
wget https://raw.githubusercontent.com/furiousteam/BLOC-forever/master/bloc-forever.sh
chmod +x BLOCd-forever.sh
```

then

If the default editor for crontab is vim (and you don't like it, like me), you can change it by running

```
select-editor
```

and select nano (first choice),

then edit the cronjob by running

```
sudo crontab -e
```

append in the editor

```
* * * * * /root/BLOCd-forever.sh > /dev/null 2>/dev/null
```

Exit the editor press CTRL+X, then Y, then press ENTER. The output should be "crontab: installing new crontab", meaning it's a success.

The script will automatically start BLOCd daemon. So, you don't have to manually run **./BLOCd** in command line.


## CHECKING THE SCRIPT

Because the **./BLOCd** daemon now runs in the background, you will not be able to see the logs directly.
You can check the logs live by typing the following in command line:

```
tail -f -n 50 /root/BLOC/BLOCd.log
```

"-n 50" means that it will also show the last 50 lines in the log file.


## STOPPING THE SCRIPT

You can stop the script from running automatically by disabling the cronjob.

```
sudo crontab -e
```

and put a **#** in from of the command (that was insert as in SETUP section) or delete that line completely.

After this, you will need to stop **./BLOCd** daemon

```
pkill BLOCd
```

### About BLOC

If this is your first time hearing about BLOC, we recommend starting by visiting the official [BLOC.MONEY](https://bloc.money) website and/or the [BLOC Wiki](https://wiki.bloc.money)

[![BLOC](https://wiki.bloc.money/images/BLOC-in-out_blue.gif)](https://bloc.money)
