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
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            cmake
            ninja
            pkg-config
            
            # C++ 工具链
            clang-tools
            gcc
            llvmPackages.clang
            llvmPackages.lldb
            
            # 开发工具
            bear
            gdb
            valgrind
          ];

          env = {
            CC = "clang";
            CXX = "clang++";
            CMAKE_GENERATOR = "Ninja";
            CXXFLAGS = "-std=c++20";
          };

          shellHook = ''
            echo "🚀 C++ 开发环境已激活！"
            echo "  编译器: $(clang++ --version | head -n1)"
            echo "  CMake: $(cmake --version | head -n1)"
            echo "  Clangd: $(clangd --version | head -n1)"
          '';
        };
      }
    );
}