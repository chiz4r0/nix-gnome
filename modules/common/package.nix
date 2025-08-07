{ pkgs, ... }:
{
  programs.firefox.enable = true;
  programs.dconf.enable = true;
  programs.zsh.enable = true;
  environment.systemPackages = with pkgs; [
    vim
    wget
  ];
}