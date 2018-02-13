## INFO

Script for testing if blockchaincoind daemon is running. If it's not running, it will start the blockchaincoind daemon.

Idea taken from https://superuser.com/a/685444/124884


## SETUP

The script needs to be put as a cronjob that runs every minute.

```
cd ~
wget https://raw.githubusercontent.com/furiousteam/blockchaincoind-forever/master/blockchaincoind-forever.sh
chmod +x blockchaincoind-forever.sh
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
* * * * * /root/blockchaincoind-forever.sh > /dev/null 2>/dev/null
```

Exit the editor press CTRL+X, then Y, then press ENTER. The output should be "crontab: installing new crontab", meaning it's a success.

The script will automatically start blockchaincoind daemon. So, you don't have to manually run **./blockchaincoind** in command line.


## CHECKING THE SCRIPT

Because the **./blockchaincoind** daemon now runs in the background, you will not be able to see the logs directly.
You can check the logs live by typing the following in command line:

```
tail -f -n 50 /root/blockchain-coin/blockchaincoind.log
```

"-n 50" means that it will also show the last 50 lines in the log file.


## STOPPING THE SCRIPT

You can stop the script from running automatically by disabling the cronjob.

```
sudo crontab -e
```

and put a **#** in from of the command (that was insert as in SETUP section) or delete that line completely.

After this, you will need to stop **./blockchaincoind** daemon

```
pkill blockchaincoind
```
