{ inputs, pkgs, ... }:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  users.users.tabun = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "video" "disk" "kvm" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };


  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;

    users.tabun = {
      home.username = "tabun";
      home.homeDirectory = "/home/tabun";
      home.stateVersion = "24.05"; # versi home-manager, bukan NixOS

      programs.home-manager.enable = true;

      programs.git = {
        enable = true;
        userEmail = "rezky@atmaluhur.ac.id";
        userName = "chiz4r0";
      };

      home.packages = with pkgs; [
        android-studio
        libreoffice-fresh
        mpv
        obsidian
        remmina
        vscode
        gnomeExtensions.blur-my-shell
      ];
      dconf = {
        enable = true;
        settings = {
          "org/gnome/desktop/background" = {
            color-shading-type = "solid";
            picture-uri = "file:///data/Pictures/grum.jpg";
            picture-uri-dark = "file:///data/Pictures/grum.jpg";
          };

          "org/gnome/desktop/interface" = {
            color-scheme = "prefer-dark";
          };

          "org/gnome/mutter" = {
            experimental-features = [
              "scale-monitor-framebuffer"
              "xwayland-native-scaling"
            ];
          };

          "org/gnome/shell" = {
            disable-user-extensions = false;
            enabled-extensions = with pkgs.gnomeExtensions; [
              blur-my-shell.extensionUuid
            ];
          };


        };
      };
    };
  };
}