{ inputs, pkgs, ... }:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  security.sudo.wheelNeedsPassword = false;

  programs.zsh.enable = true; ## harus disini
  users.users.tabun = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "audio" "video" "disk" "kvm" ];
    packages = with pkgs; [ tree ];
  };

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    users.tabun = {
      imports = [
        ./home.nix
        inputs.nvf.homeManagerModules.default
      ];
    };
  };
}