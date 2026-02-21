#!/bin/sh
set -e
set -x


go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.cn,direct

if [ -f /etc/apt/sources.list.d/debian.sources ]; then
    sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources
fi


apt-get update

apt-get install -y --no-install-recommends gcc libc6-dev make git




apt-get clean
rm -rf /var/lib/apt/lists/*
rm -rf /tmp/*