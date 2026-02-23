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
    unzip \
    fish

curl -sS https://starship.rs/install.sh | sh -s -- -y
mkdir -p $HOME/.config/fish
echo "starship init fish | source" >> $HOME/.config/fish/config.fish


apt-get clean
rm -rf /var/lib/apt/lists/*
rm -rf /tmp/*