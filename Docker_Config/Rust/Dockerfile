FROM rust:latest

ENV RUSTUP_UPDATE_ROOT="https://mirrors.ustc.edu.cn/rust-static/rustup" \
    RUSTUP_DIST_SERVER="https://mirrors.ustc.edu.cn/rust-static"


ADD build.sh /tmp/build.sh


RUN chmod +x /tmp/build.sh && /tmp/build.sh