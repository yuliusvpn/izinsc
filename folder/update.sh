#!/bin/bash
REPO2="https://github.com/yuliusvpn/izinsc/raw/main/"

function spinner() {
    local pid=$!
    local delay=0.1
    local spinstr='|/-\|'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf " \033[0;33m[ Success ]\033[0m \b\b\b\b"
}

function downloadingsc() {
cd
wget -q -O sc.zip "${REPO2}folder/sc"
unzip sc.zip
chmod +x menu/*
mv menu/* /usr/local/sbin

wget -q -O alt.zip "${REPO2}folder/alt"
unzip alt.zip
chmod +x all-t/*
mv all-t/* /usr/bin

rm -fr /usr/sbin/xdxl
mkdir -p /usr/sbin/xdxl
mkdir -p /usr/sbin/xdxl/style
wget -q -O style.zip "${REPO2}folder/y"
unzip style.zip
chmod +x style/*
mv style/* /usr/sbin/xdxl/style

}
function awal() {
mkdir /usr/bin/xdxl
wget -q -O .bashrc.1 "${REPO}xray/.bashrc.1"
chmod +x .bashrc.1
mv .bashrc.1 /usr/bin/xdxl
}

function removesc() {
rm -fr menu
rm -fr menu.zip
rm -fr up-x
rm -fr update.sh
rm -fr all-t
rm -fr alt.zip
rm -fr style
rm -fr style.zip
rm -fr sc.zip
}

function banner() {
rm -fr /etc/fvstore.txt
wget -q -O /etc/fvstore.txt "${REPO}ssh/issue.net"
systemctl restart dropbear
}

function updatesc() {
sleep 1
downloadingsc
removesc
}
clear
echo -e ""
echo -e "  Updating script !!!"
echo -ne " Please Wait... ";
( updatesc ) & spinner
sleep 2
menu
