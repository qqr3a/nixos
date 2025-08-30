{ pkgs, config, ... }: {
    home.file.".config/caelestia/shell.json".source = ./shell.json;
}