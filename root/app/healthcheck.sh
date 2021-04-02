#!/bin/sh

VPN_IP=$(curl ifconfig.io)
REAL_IP=$(nslookup -type=a $REAL_IP | tail -n 2 | cut -d ' ' -f2 | head -n 1)
[[ $REAL_IP == $VPN_IP ]] && \
    kill 1
true
