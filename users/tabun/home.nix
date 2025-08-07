{ config, pkgs, ... }:

{
  home.username = "tabun";
  home.homeDirectory = "/home/tabun";
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  imports = [
    ../../home/modules/git.nix
    ../../home/modules/programs.nix
    ../../home/modules/gnome.nix  
    ../../home/modules/nvim  
    ../../home/modules/zsh.nix

  ];
}