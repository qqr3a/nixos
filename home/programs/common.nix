{ lib, pkgs, config, username, ...}: {
    home.packages = with pkgs; [
        home-manager

        discord
        vscode

        rustup
        rustc
        nodejs
        nil
        gcc
        python3

        file

        imagemagick
        pywal16
        firefox
        ghostty
        #kdePackages.dolphin
        pavucontrol
        bluez
        blueman
        spotify
    ];

    home.file.".config/ghostty/config".text = ''
        theme = "/home/${username}/.cache/wal/ghostty.conf"
        font-family = "FiraCode Nerd Font"
        font-size = 10
        window-decoration = false
        mouse-hide-while-typing = true
        background-opacity = 0.8
        window-save-state = always
        desktop-notifications = false
        confirm-close-surface = false
        initial-command = "fastfetch; exec zsh"
    '';

    home.file.".config/fastfetch/config.jscon".text = ''
        {
        "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
        "modules": [
            "title",
            "separator",
            "os",
            "host",
            "kernel",
            "uptime",
            "packages",
            "shell",
            "display",
            "wm",
            "wmtheme",
            "cpu",
            "gpu",
            "memory",
            "theme",
            "terminal",
            "terminalfont",
            "disk",
            "localip",
            "battery",
            "break",
            "colors"
        ]
        }
    '';


    programs = {
        tmux = {
            enable = true;
            clock24 = true;
            keyMode = "vi";
            extraConfig = "mouse on";
        };

        btop.enable = true; # replacement of htop/nmon
        eza.enable = true; # A modern replacement for ‘ls’
        jq.enable = true; # A lightweight and flexible command-line JSON processor
        aria2.enable = true;
    };

    services = {
        #syncthing.enable = true;

        # auto mount usb drives
        udiskie.enable = true;
    };
}

