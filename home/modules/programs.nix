{ pkgs, unstablePkgs, ... }:
{
  home.packages = with pkgs; [
    
    libreoffice-fresh
    mpv
    obsidian
    remmina
    vscode
    gnomeExtensions.blur-my-shell
  ]  ++ (with unstablePkgs; [
    android-studio
  ]);
}