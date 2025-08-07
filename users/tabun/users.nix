{ inputs, pkgs, ... }:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  users.users.tabun = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "video" "disk" "kvm" ];
    packages = with pkgs; [ tree ];
  };

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;

    users.tabun = import ./home.nix;
  };
}