{pkgs, ...}: {
  home.packages = with pkgs; [
    android-studio
    gedit
    jetbrains.webstorm
    libreoffice-fresh
    mpv
    obsidian
    remmina
    vscode
    gnomeExtensions.blur-my-shell
  ];
}
