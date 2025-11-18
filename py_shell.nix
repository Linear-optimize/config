{pkgs ? import <nixpkgs> {}}:

pkgs.mkShell {
  packages = with pkgs; [
    uv
    python3
    python3Packages.pip
  ];
}