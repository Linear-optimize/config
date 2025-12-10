{ config,pkgs,...}:

{
	home.stateVersion = "23.05";

	programs.direnv ={
		enable = true;
		nix-direnv.enable = true;
	};
	
	home.packages = with pkgs;[
		
		fish
		starship
		neovim
		gnumake
		pkg-config
		unzip
		bun
		nodejs
		pnpm
		git
		coreutils
		fzf
		lazygit
		xclip
		curl
		fastfetch
		cmake
		 ninja
		  llvmPackages.clang
            llvmPackages.lldb
	     clang-tools
	     bear
            
            valgrind
	    noto-fonts-cjk-sans
	    	
	    qt6.qtbase
	    (python3.withPackages (p: with p; [
		  numpy      # 解决 NumPy 未支持的问题
		  matplotlib # 解决 Matplotlib 未安装的问题
		  scipy      # (可选，推荐) 科学计算核心库
		  pandas
		  pyqt6  # (可选) 数据分析库
		]))
	
	];

	fonts.fontconfig.enable = true;
	
}