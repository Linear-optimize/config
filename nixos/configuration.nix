{ config, lib, pkgs, ... }:

# 1. 定义 unstable 属性 (使用 let ... in 结构)
let
  # 引入 nixpkgs-unstable 频道
  unstable = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz") {
    config = config.nixpkgs.config;
  };
in 
{
  imports = [
    # include NixOS-WSL modules
    <nixos-wsl/modules>
    <home-manager/nixos>
  ];
  
  # ... 其他现有配置 ...
  
  # 2. 将 unstable 传递给 Home Manager 配置
  home-manager.users.rene = (import ./home.nix)  {
    inherit config pkgs lib; 
  unstable = unstable;
  };

  # ... 其他现有配置 ...

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
    hashedPassword ="$6$UtGMaqdMJDSXckHf$FUG4AEWeJH2o9M9eSK10fyjwj0r9YZLI5L6YHvYbFlYstOvasB4GdUVCpltAB72FB485EOq3HFKKpqa.mx82M1";
  };

  security.sudo.enable = true;
			
  environment.shells = with pkgs; [
    fish
  ];
}