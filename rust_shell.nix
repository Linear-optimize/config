{pkgs ? import <nixpkgs> {}}:

pkgs.mkShell {
  packages = with pkgs; [
    rustup
    pkg-config
    openssl
  ];

  shellHook = ''
    # 初始化 rustup（如果尚未初始化）
    if [ ! -f ~/.rustup/settings.toml ]; then
      rustup default stable
    fi
    
    # 安装 Rust 源码
    rustup component add rust-src
    
    mkdir -p .cargo
    if [ ! -f .cargo/config.toml ]; then
      cat > .cargo/config.toml << 'EOF'
[source.crates-io]
replace-with = 'aliyun'

[source.aliyun]
registry = "sparse+https://mirrors.aliyun.com/crates.io-index/"

[net]
git-fetch-with-cli = true
EOF
    fi
    export CARGO_HOME="$(pwd)/.cargo"
    
    # 设置 RUST_SRC_PATH
    export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/library"
    
    echo "✅ Rust 环境已配置"
    echo "Rustup: $(rustup --version)"
    echo "Rust 源码路径: $RUST_SRC_PATH"
  '';
}