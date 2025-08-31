{ lib, pkgs, config, username, ...}: {
    home.packages = with pkgs; [
        bluez
        blueman
        spotify
        discord
        vscode
        imagemagick
        pywal16
        firefox
        ungoogled-chromium
        ghostty
        #kdePackages.dolphin
        pavucontrol
        wireplumber
        xdg-desktop-portal-wlr 
        logseq
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
}

