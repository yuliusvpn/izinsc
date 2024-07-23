#!/bin/bash
GITHUB_CMD="https://raw.githubusercontent.com/izulx1/autoscript/master/"
wget -q -O /etc/systemd/system/vpn.service "${GITHUB_CMD}service/ws-epro.service"
wget -q -O /etc/systemd/system/ws.service "${GITHUB_CMD}service/ws-python.service"
wget -O /usr/sbin/ws.py "${GITHUB_CMD}proxy/ws.py" >/dev/null 2>&1
wget -O /usr/sbin/ws "${GITHUB_CMD}ssh/ws" >/dev/null 2>&1
wget -O /usr/sbin/ws.conf "${GITHUB_CMD}ssh/ws.conf" >/dev/null 2>&1
chmod +x /usr/sbin/ws
chmod +x /usr/sbin/ws.py
chmod 644 /usr/sbin/ws.conf

systemctl enable ws vpn >/dev/null 2>&1
systemctl restart ws vpn >/dev/null 2>&1
