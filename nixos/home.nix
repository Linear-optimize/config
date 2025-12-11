{ config,pkgs,unstable,...}:

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
           asymptote				    	
	    qt6.qtbase

	    (unstable.python3.withPackages (p: with p; [
      numpy
      matplotlib
      scipy
      pandas
      pyqt6
    ]))

	
	];	
	  	fonts.fontconfig.enable = true;
	
}