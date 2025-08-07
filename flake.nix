{
  description = "NixOS configuration (using unstable)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      devzc0de = lib.nixosSystem {
        inherit system;

        modules = [
          ./hosts/devzc0de/configuration.nix
        ];

        specialArgs = {
          inherit self inputs;
        };
      };
    };
  };
}
