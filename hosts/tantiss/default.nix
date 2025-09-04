# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, caelestiaShell, caelestiaCLI, ... }:

{
    imports = [
        ../../modules/system.nix
        ../../modules/hypr.nix
        ./hardware-configuration.nix
    ];

    boot = {
        loader.systemd-boot.enable = true;
        loader.efi.canTouchEfiVariables = true;
        loader.grub.enable = false;
        kernelPackages = pkgs.linuxPackages_latest;
    };


    networking = {
        hostName = "Tantiss";
        networkmanager.enable = true;
    };


    services = {
        displayManager.ly.enable = true;
        printing.enable = true;
        xserver.xkb = {
            layout = "gb";
            variant = "";
        };
        pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
        };
        flatpak.enable = true;
    };
    xdg.portal = {
        enable = true;
        extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
    };

    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    hardware.bluetooth.enable = true;

    environment = {
        systemPackages = with pkgs; [
            caelestiaShell
            caelestiaCLI
            appimage-run
        ];
        variables.EDITOR = "nvim";
    };

    programs.steam.enable = true;
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;

    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "25.05"; # Did you read the comment?

}
