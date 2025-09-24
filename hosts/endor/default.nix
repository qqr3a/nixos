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

    #environment.systemPackages = with pkgs; [
     
     #   intel-undervolt
    #];


    services.undervolt = {
        enable = true;
        coreOffset = -100; 
        gpuOffset = -60;   
        uncoreOffset = -100;
        useTimer = true; 
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
	
	
    services.plex = {
    	enable = true;
	openFirewall = true;
    };
    hardware.graphics = {
    	enable = true;
  	};

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    open = false;

    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
