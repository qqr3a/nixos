{
  pkgs,
  config,
  ...
}: {

  home.file.".config/hypr/categories/animations.conf".source = ./categories/animations.conf;
  home.file.".config/hypr/categories/autostart.conf".source = ./categories/autostart.conf;
  home.file.".config/hypr/categories/default-programs.conf".source = ./categories/default-programs.conf;
  home.file.".config/hypr/categories/env-var.conf".source = ./categories/env-var.conf;
  home.file.".config/hypr/categories/input.conf".source = ./categories/input.conf;
  home.file.".config/hypr/categories/keymaps.conf".source = ./categories/keymaps.conf;
  home.file.".config/hypr/categories/look-and-feel.conf".source = ./categories/look-and-feel.conf;
  home.file.".config/hypr/categories/monitors.conf".source = ./categories/monitors.conf;
  home.file.".config/hypr/hyprpaper.conf".source = ./hyprpaper.conf;
  home.file.".config/hypr/wallpaper-switch.sh".source = ./wallpaper-switch.sh;
  home.file.".config/hypr/hypridle.conf".source = ./hypridle.conf;
  home.file.".config/hypr/hyprlock.conf".source = ./hyprlock.conf;
  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;

}
