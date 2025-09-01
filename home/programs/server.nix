{ lib, pkgs, ...}: {
    home.packages = with pkgs; [
        powerstat
    ];

    services.syncthing = {
        enable = true;
        user = "admin";     
        guiAddress = "0.0.0.0:8384"; 
        configDir = "/home/admin/.config/syncthing";
        settings.gui = {
            user = "admin";
            password = "secretpw";
        };
    };
    #networking.firewall.allowedTCPPorts = [ 8384 ];

}

