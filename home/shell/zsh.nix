{ pkgs, ... }:

{
  programs.zsh.enable = true;
  home.file.".p10k.zsh".source = ./.p10k.zsh;

  home.packages = with pkgs; [
    zsh
    oh-my-zsh
    zsh-powerlevel10k
  ];

  programs.zsh.initContent = ''
    export EDITOR=nvim
    alias nvim="nix run /etc/nixos"
    source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    source ./.p10k.zsh
    eval "$(zoxide init --cmd cd zsh)"

  '';
}
