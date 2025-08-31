# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, caelestiaShell, caelestiaCLI, ... }:

{
    imports = [
        ../../modules/system.nix
        ./hardware-configuration.nix
    ];

    boot = {
        loader.systemd-boot.enable = true;
        loader.efi.canTouchEfiVariables = true;
        loader.grub.enable = false;
        kernelPackages = pkgs.linuxPackages_latest;
    };

    environment.systemPackages = with pkgs; [
        intel-undervolt
    ];


    services.intel-undervolt = {
        enable = true;
        settings = {
            "CPU" = -80;
            #"GPU" = -50;
        };
        };

    networking = {
        hostName = "Endor";
        networkmanager.enable = true;
    };

    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

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
