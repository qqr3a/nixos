{ pkgs, ...}: {
    environment.systemPackages = with pkgs; [
        ungoogled-chromium
        logseq
        discord
        
    ];
}

