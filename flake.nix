{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };
    mozilla = {
      url = "github:colemickens/flake-firefox-nightly";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixos-hardware,
    mozilla,
    ...
  } @ inputs: {
    nixosConfigurations = {
      "binary" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/binary/modules/system.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              backupFileExtension = "backup";
              users.nyanbinary = ./hosts/binary/modules/home.nix;
            };
            system = {
              stateVersion = "23.11";
              autoUpgrade = {
                enable = true;
                flake = inputs.self.outPath;
                flags = [
                  "--update-input"
                  "nixpkgs"
                  "-L" # print build logs
                ];
                allowReboot = true;
              };
            };
          }
        ];
      };
    };
  };
}
