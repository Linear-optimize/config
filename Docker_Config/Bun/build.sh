#!/bin/sh
set -e
set -x

mkdir -p ~/.bun
cat << EOF > ~/.bunfig.toml
[install]
registry = "https://registry.npmmirror.com"
EOF

if [ -f /etc/apt/sources.list.d/debian.sources ]; then
    sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources
fi


apt-get update
apt-get install -y --no-install-recommends \
    git \
    curl \
    ca-certificates \
    unzip

apt-get clean
rm -rf /var/lib/apt/lists/*