{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.baseModules.nix;
in {
  options.baseModules.nix = {
    enable = lib.mkEnableOption "";
  };
  # Nix specific settings
  config = lib.mkIf cfg.enable {
    nix = {
      package = pkgs.nixVersions.unstable;
      settings = {
        # All Experimental Features on as of December 15th, 2023
        experimental-features = [
          "auto-allocate-uids"
          "ca-derivations"
          "cgroups"
          "configurable-impure-env"
          "daemon-trust-override"
          "dynamic-derivations"
          "fetch-closure"
          "fetch-tree"
          "flakes"
          "git-hashing"
          "impure-derivations"
          #"mounted-ssh-store"
          "nix-command"
          "no-url-literals"
          "parse-toml-timestamps"
          "read-only-local-store"
          "recursive-nix"
          "verified-fetches"
        ];
        auto-optimise-store = true;
        auto-allocate-uids = true;
        keep-derivations = false;
        keep-outputs = false;
        use-cgroups = true;
        sandbox = true;
      };
      sshServe = {
        protocol = "ssh-ng";
      };
      channel = {
        enable = true;
      };
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };
      registry = lib.mapAttrs (name: value: {flake = value;}) (lib.filterAttrs (name: value: value ? outputs) inputs);
      nixPath = map (name: "${name}=/etc/nix/path/${name}") (lib.attrNames inputs);
    };
    # Make local channel point to our flake
    environment.etc =
      {
        "nix/nixpkgs-config.nix".text = lib.mkDefault ''
          {
            allowUnfree = ${lib.boolToString (config.nixpkgs.config.allowUnfree or false)};
          }
        '';
      }
      // lib.mapAttrs' (name: value: lib.nameValuePair "nix/path/${name}" {source = builtins.toString value;}) inputs;

    # Configure nixpkgs
    nixpkgs = {
      config = {
        allowAliases = false;
        allowUnfree = true;
        contentAddressedByDefault = false;
      };
    };
  };
}
