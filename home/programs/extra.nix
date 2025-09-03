{ lib, pkgs, config, username, ...}: {
    home.packages = with pkgs; [
        ungoogled-chromium
        logseq
        
    ];
}

