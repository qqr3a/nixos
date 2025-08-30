{pkgs, ...}: {
    programs.hyprland = {
        enable = true;
    };
    environment.systemPackages = with pkgs; [
        xdg-desktop-portal-hyprland
        wireplumber
        wlsunset
        hyprshot
        bibata-cursors
    ];

}