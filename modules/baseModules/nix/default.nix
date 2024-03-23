{
  config,
  lib,
  pkgs,
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
          "mounted-ssh-store"
          "nix-command"
          "no-url-literals"
          "parse-toml-timestamps"
          "read-only-local-store"
          "recursive-nix"
          "verified-fetches"
        ];
        auto-allocate-uids = true;
        auto-optimise-store = true;
        keep-build-log = false;
        keep-derivations = false;
        keep-outputs = false;
        pure-eval = true;
        sandbox = true;
        use-cgroups = true;
        use-xdg-base-directories = true;
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
        persistent = true;
      };
    };
    # Configure nixpkgs
    nixpkgs = {
      config = {
        allowAliases = false;
        allowUnfree = true;
        contentAddressedByDefault = false;
      };
      flake = {
        setNixPath = true;
        setFlakeRegistry = true;
      };
    };
  };
}
