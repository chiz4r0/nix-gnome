{
  config,
  pkgs,
  ...
}: let
  MyAliases = {
    ll = "ls -l";
    update = "sudo nixos-rebuild switch --flake /data/dotfiles#devzc0de";
    upgrade = "nix flake update --flake /data/dotfiles#devzc0de && sudo nixos-rebuild switch --flake /data/dotfiles#devzc0de";
  };
in {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    sessionVariables = {
      EDITOR = "vim";
      VISUAL = "vim";
    };
    shellAliases = MyAliases;
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    oh-my-zsh = {
      enable = true;
      plugins = ["git"];
      theme = "steeef";
    };
  };
}