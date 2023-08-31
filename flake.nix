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
    nixosConfigurations."binary" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/binary/default.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            backupFileExtension = "backup";
            users.nyanbinary = ./hosts/binary/home.nix;
          };
          nixpkgs.overlays = [
            mozilla.overlay
            fenix.overlays.default
          ];
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
}
