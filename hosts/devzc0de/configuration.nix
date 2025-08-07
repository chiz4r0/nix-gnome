# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, unstablePkgs, ... }:

{
  imports =
    [ 
      ../../modules/common/amd.nix
      ../../modules/common/bluetooth.nix
      ../../modules/common/boot.nix
      ../../modules/common/displaylink.nix
      ../../modules/common/fonts.nix
      ../../modules/common/gnome.nix
      ../../modules/common/networking.nix
      ../../modules/common/pipewire.nix
      ../../modules/common/tlp.nix
      ../../modules/hardware/laptop.nix
      ../../users/tabun/users.nix
    ];

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";
  zramSwap.enable = true;
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.05"; # Did you read the comment?
  nix.settings.experimental-features = ["nix-command" "flakes"];

}

