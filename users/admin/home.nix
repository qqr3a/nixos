{ pkgs, lib, caelestiaShell, caelestiaCLI, ... }:

{
  imports = [
    ../../home/core.nix
    
    ../../home/programs/common.nix

    ../../home/shell
  ];
}
