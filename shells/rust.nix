{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    yafas = {
      url = "github:UbiqueLambda/yafas";
    };
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    yafas,
    fenix,
    ...
  }:
    yafas.allSystems nixpkgs ({
      pkgs,
      system,
    }: {
      formatter = pkgs.alejandra;
      devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          lldb
          (fenix.packages.${system}.complete.withComponents [
            "rustc"
            "cargo"
            "rustfmt"
            "rust-analyzer"
            "clippy"
            "miri"
            "rust-src"
          ])
        ];
      };
    });
}
