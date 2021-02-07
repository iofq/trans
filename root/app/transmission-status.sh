#!/bin/bash
echo -e "STATUS: $(date)" > /config/status.txt
echo -e "IP address: $(curl -s ifconfig.me)" >> /config/status.txt
echo -e "_______________________________" >> /config/status.txt
echo -e "$(transmission-remote -l)" >> /config/status.txt
echo -e "_______________________________" >> /config/status.txt
echo -e "$(transmission-remote -st)" >> /config/status.txt
