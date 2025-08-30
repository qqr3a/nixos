# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, caelestiaShell, caelestiaCLI, ... }:

{
    imports = [
        ../../modules/system.nix
        ./hardware-configuration.nix
    ];

    boot = {
        loader.efi.canTouchEfiVariables = true;
        loader.grub.enable = true;
        kernelPackages = pkgs.linuxPackages_latest;
    };


    networking = {
        hostName = "Endor";
        networkmanager.enable = true;
    };

    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    networking.

    environment = {
        variables.EDITOR = "nvim";
    };

    security.rtkit.enable = true;

    services.logind.lidSwitch = "ignore";
    services.logind.lidSwitchExternalPower = "ignore";
    services.logind.lidSwitchDocked = "ignore";

    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "25.05"; # Did you read the comment?


}
