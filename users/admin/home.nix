{ pkgs, lib, caelestiaShell, caelestiaCLI, ... }:

{
  imports = [
    ../../home/core.nix
    
    ../../home/programs/common.nix
    ../../home/programs/server.nix

    ../../home/shell
  ];
}
