#!/bin/sh

set -x


mkdir -vp ${CARGO_HOME:-$HOME/.cargo}

cat << EOF | tee -a ${CARGO_HOME:-$HOME/.cargo}/config.toml
[source.crates-io]
replace-with = 'ustc'

[source.ustc]
registry = "sparse+https://mirrors.ustc.edu.cn/crates.io-index/"

[registries.ustc]
index = "sparse+https://mirrors.ustc.edu.cn/crates.io-index/"
EOF


sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources


apt-get update
apt-get install gcc-x86-64-linux-gnu -y

rustup target add x86_64-unknown-linux-musl


cargo install cargo-watch


apt-get autoclean
rm -rf /var/lib/apt/lists/*
rm -rf /tmp/*