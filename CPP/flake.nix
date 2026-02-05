{
  description = "C++ development environment with Flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        customStdenv = pkgs.clangStdenv;
      in
      {
        devShells.default = pkgs.mkShell.override { stdenv = customStdenv; }{
          
          packages = with pkgs; [
            # 构建工具
            cmake
            ninja
            pkg-config
            
            # C++ 工具链 (全套 LLVM)
            llvmPackages.clang      
            llvmPackages.libcxx     
            clang-tools             
            
            
            stdenv.cc.libc.dev      
            
            # 调试与开发工具
            bear
            gdb
            valgrind
          ];

          
          CC = "clang";
          CXX = "clang++";
          
          # 强制指定 C++ 标准并使用 libc++
          CXXFLAGS = "-std=c++20 -stdlib=libc++";
          
          
          CPATH = builtins.concatStringsSep ":" [
            "${pkgs.llvmPackages.libcxx.dev}/include/c++/v1"
            "${pkgs.stdenv.cc.libc.dev}/include"
            "${pkgs.llvmPackages.clang}/resource-root/include"
          ];

          CMAKE_GENERATOR = "Ninja";

          shellHook = ''
            echo "🚀 C++ 开发环境已激活！"
            echo "  编译器: $(clang++ --version | head -n1)"
            echo "  CMake: $(cmake --version | head -n1)"
            echo "  Clangd: $(clangd --version | head -n1)"
            echo "  提示: 如果 Neovim 报错，请运行 'direnv allow' 并重启 LSP"
          '';
        };
      }
    );
}