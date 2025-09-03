{ pkgs, lib, caelestiaShell, caelestiaCLI, ... }:

{
  imports = [
    ../../home/core.nix
    
    ../../home/programs/common.nix
    ../../home/programs/desktop.nix
    ../../home/hypr
    ../../home/caelestia
    ../../home/shell

  ];

  programs.git = {
    userName = "qqr3a";
    userEmail = "nitro5cy@outlook.com";
  };
}
