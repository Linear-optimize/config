{ config, lib, pkgs, ... }:

{
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
    <home-manager/nixos>
  ];

  wsl.enable = true;
  wsl.defaultUser = "rene";

  wsl.docker-desktop.enable = true;

	
  programs.nix-ld.enable = true;	
  security.sudo.wheelNeedsPassword = true;


  system.stateVersion = "25.05"; # Did you read the comment?
	nix.settings = {
  substituters = [
    "https://cache.nixos.org"
    "https://mirrors.tuna.tsinghua.edu.cn/nix-cache"
  ];
  trusted-public-keys = [
    "cache.nixos.org-1:6NCHD9SmdCnoVxJ1svHnm44pmgdPtpL1qgZkPyg24uE="
    "mirrors.tuna.tsinghua.edu.cn-1:f9I8/X3N529j8GvS/2n5HwE43V75B6s2E50147gW0e4="
  ];
};

users.users.rene = {
  isNormalUser = true;
  description = "Rene's User on WSL";
    extraGroups = [ "wheel" ];	
  hashedPassword ="XXX"; //input your password
  };

  security.sudo.enable = true;
			


home-manager.users.rene = import ./home.nix;

	

environment.shells  = with pkgs; [
	fish
];
}