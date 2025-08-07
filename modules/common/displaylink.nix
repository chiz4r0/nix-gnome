{ config, lib, pkgs, ... }:
{
  boot = {
    extraModulePackages = [ config.boot.kernelPackages.evdi ];
    initrd = {
      # List of modules that are always loaded by the initrkkkd.
      kernelModules = [
        "evdi"
      ];
    };
  };

  environment.variables = {
	  KWIN_DRM_PREFER_COLOR_DEPTH = "24";
	};

  services.xserver.videoDrivers = [ "displaylink" ];
  systemd.services.dlm.wantedBy = [ "multi-user.target" ];
  environment.systemPackages = with pkgs; [
    displaylink
  ];

}