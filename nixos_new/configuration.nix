{ config, pkgs, ... }:

{
  # WSL
  wsl.enable = true;
  wsl.defaultUser = "rene";
  wsl.docker-desktop.enable = true;

  # 用户
  users.users.rene = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    hashedPassword =
      "$6$UtGMaqdMJDSXckHf$FUG4AEWeJH2o9M9eSK10fyjwj0r9YZLI5L6YHvYbFlYstOvasB4GdUVCpltAB72FB485EOq3HFKKpqa.mx82M1";
  };

  # Shell
  environment.shells = with pkgs; [ fish ];

  programs.nix-ld.enable = true;
  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = true;

  # Nix
nix.settings = {
  experimental-features = [ "nix-command" "flakes" ];

  substituters = [
    "https://mirrors.ustc.edu.cn/nix-channels/store"
    "https://cache.nixos.org"
  ];

  trusted-public-keys = [
    "mirrors.ustc.edu.cn-1:ZfE9QqF2F6eZ9h2FqYy+5QkNq2N2b1z7u8b5JHn7p2U="
    "cache.nixos.org-1:6NCHD9SmdCnoVxJ1svHnm44pmgdPtpL1qgZkPyg24uE="
  ];
};

 
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";

  home-manager.users.rene = import ./home.nix;

  system.stateVersion = "25.05";
}
