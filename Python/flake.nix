# flake.nix
{
  description = "Complete Python development environment with UV";

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
          packages = with pkgs; [
            uv
            python3
            python3Packages.pip
            python3Packages.virtualenv
            python3Packages.ipython
            python3Packages.jupyter
            python3Packages.black      # 代码格式化
            python3Packages.isort      # import 排序
            python3Packages.flake8     # 代码检查
            python3Packages.mypy       # 类型检查
            python3Packages.pytest     # 测试框架
          ];

          shellHook = ''
            # 配置 UV 使用国内镜像
            export UV_INDEX_URL="https://pypi.tuna.tsinghua.edu.cn/simple"
            export UV_EXTRA_INDEX_URL="https://mirrors.aliyun.com/pypi/simple/"
            
            echo "🚀 Python 开发环境已激活!"
            echo "UV: $(uv --version)"
            echo "Python: $(python3 --version)"
            echo ""
            echo "📦 可用工具:"
            echo "  uv init .          # 初始化项目"
            echo "  uv add <package>   # 添加依赖"
            echo "  uv run <script>    # 运行脚本"
            echo "  uv sync            # 安装依赖"
            echo ""
            echo "🔧 开发工具:"
            echo "  black, isort, flake8, mypy, pytest, ipython"
            echo ""
            echo "🌐 镜像源: $UV_INDEX_URL"
          '';
        };
      }
    );
}