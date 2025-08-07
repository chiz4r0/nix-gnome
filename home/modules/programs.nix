{ pkgs, ... }:
{
  home.packages = with pkgs; [
    android-studio
    libreoffice-fresh
    mpv
    obsidian
    remmina
    vscode
    gnomeExtensions.blur-my-shell
  ];
}