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
        asymptote    
	    noto-fonts-cjk-sans
	    qt6.qtbase	
	    

	    (python3.withPackages (p: with p; [
		  numpy      
		  matplotlib 
		  scipy      
		  pandas
		  pyqt6  
		]))
	
	];

	fonts.fontconfig.enable = true;
	
}