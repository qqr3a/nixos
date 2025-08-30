{ pkgs, lib, username, ... }: {
    users.users.${username} = {
        isNormalUser = true;
        description = username;
        extraGroups = [ "networkmanager" "wheel" ];
    };

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    nix.gc = {
        automatic = lib.mkDefault true;
        dates = lib.mkDefault "weekly";
        options = lib.mkDefault "--delete-older-than 7d";
    };

    nixpkgs.config.allowUnfree = true;

    time.timeZone = "Europe/London";

    /*
    i18n.defaultLocale = "en_GB.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_GB.UTF-8";
        LC_IDENTIFICATION = "en_GB.UTF-8";
        LC_MEASUREMENT = "en_GB.UTF-8";
        LC_MONETARY = "en_GB.UTF-8";
        LC_NAME = "en_GB.UTF-8";
        LC_NUMERIC = "en_GB.UTF-8";
        LC_PAPER = "en_GB.UTF-8";
        LC_TELEPHONE = "en_GB.UTF-8";
        LC_TIME = "en_GB.UTF-8";
    };
    */

    console.keyMap = "uk";

    fonts.packages = with pkgs; [
        nerd-fonts.fira-code
    ];

    networking.firewall.enable = false;

    services.openssh = {
        enable = true;
        settings = {
            # X11Forwarding = true;
            # PermitRootLogin = "no";
            # PasswordAuthentication = false;
        };
        openFirewall = true;
    };

    environment.systemPackages = with pkgs; [
        wget
        git
        lm_sensors
        fastfetch
        neovim
    ];


}