{ pkgs, ...}: {
    environment.systemPackages = with pkgs; [
        ungoogled-chromium
        discord
        
    ];
}

