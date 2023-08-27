{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };
    mozilla = {
      url = "github:mozilla/nixpkgs-mozilla/master";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixos-hardware, 
    mozilla,
    fenix,
    home-manager,
    ...
  } @ inputs: {
    nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
          ./hosts/nixos/configuration.nix
          home-manager.nixosModules.home-manager
          {
          home-manager = {
            users.nyanbinary = ./hosts/nixos/home.nix;
          };
        }
      ];
    };
  };
}

