#!/bin/bash

# Script for testing if blockchaincoind daemon is running. if not, start it
/bin/netstat -tulpn | awk '{print $4}' | awk -F: '{print $2}' | grep ^2082$ > /dev/null 2>/dev/null
a=$(echo $?)

# 0 means running, 1 means stopped
if test $a -ne 0
then
	echo "blockchaincoind is STOPPED! starting...";
	cd /root/blockchain-coin
	./blockchaincoind > /dev/null 2>&1 &
else
	echo "blockchaincoind is running! nothing to do...";
fi

