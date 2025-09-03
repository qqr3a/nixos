{ pkgs, lib, caelestiaShell, caelestiaCLI, ... }:

{
  imports = [
    ../../home/core.nix
    
    ../../home/programs/common.nix

  ];

  programs.git = {
    userName = "qqr3a";
    userEmail = "nitro5cy@outlook.com";
  };
}
