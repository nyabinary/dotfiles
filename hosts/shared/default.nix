{
  inputs,
  pkgs,
  ...
}: {
  # Nix specific settings
  nix = {
    settings = {
      # All Experimental Features on as of August 23rd, 2023
      experimental-features = ["auto-allocate-uids" "ca-derivations" "cgroups" "daemon-trust-override" "discard-references" "dynamic-derivations" "fetch-closure" "flakes" "impure-derivations" "nix-command" "no-url-literals" "parse-toml-timestamps" "read-only-local-store" "recursive-nix" "repl-flake"];
      trusted-users = ["root" "nyanbinary"];
      auto-optimise-store = true;
      auto-allocate-uids = true;
      keep-derivations = true;
      keep-outputs = true;
      sandbox = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
    registry.nixpkgs.flake = inputs.nixpkgs;
    nixPath = ["nixpkgs=/etc/channels/nixpkgs" "nixos-config=/etc/nixos/configuration.nix" "/nix/var/nix/profiles/per-user/root/channels"];
  };

  # Configure nixpkgs
  nixpkgs.config = {
    allowUnfree = true;
    firefox.speechSynthesisSupport = true;
  };

  # Make local channel point to our flake
  environment = {
    etc."channels/nixpkgs".source = inputs.nixpkgs.outPath;
  };

  # NIX-DIRENV Settings
  environment.systemPackages = with pkgs; [direnv nix-direnv];
  environment.pathsToLink = [
    "/share/nix-direnv"
  ];
}
