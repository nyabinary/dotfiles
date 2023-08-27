{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {

  imports = [
    "${home-manager}/nixos"
    ./hardware-configuration.nix
    nixos-hardware.nixosModules.framework-13th-gen-intel
  ];

  #NixOS Settings/Config
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
      options = "--delete-older-than 30d";
    };
    registry.nixpkgs.flake = inputs.nixpkgs;
    nixPath = ["nixpkgs=/etc/channels/nixpkgs" "nixos-config=/etc/nixos/configuration.nix" "/nix/var/nix/profiles/per-user/root/channels"];
  };
  # List packages installed in system profile
  # To find package name, go to https://search.nixos.org/packages
  # To find service name, go to https://search.nixos.org/options
  environment = {
    etc."channels/nixpkgs".source = inputs.nixpkgs.outPath;
  };

  # Configure nixpkgs
  nixpkgs.config = {
    allowUnfree = true;
    firefox.speechSynthesisSupport = true;
  };

  # Boot & Bootloader Options
  boot = {
    kernelPackages = pkgs.linuxPackages_latest; # Use latest stable Linux
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  # Enable networking
  networking = {
    hostName = "nixos";
    wireless.iwd.enable = true;
    networkmanager.enable = true;
    networkmanager.wifi.backend = "iwd";
  };

  # Set your time zone
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  # Enable the X11 windowing system
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents
  services.printing.enable = true;

  # Enable sound with pipewire
  # rtkit is optional but recommended
  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };

  # Define user account
  users = {
    defaultUserShell = pkgs.nushell;
    users.nyanbinary = {
      isNormalUser = true;
      description = "Niko Cantero";
      extraGroups = ["networkmanager" "wheel"];
      packages = with pkgs; [
        #Entertainment
        armcord
        telegram-desktop
        tidal-hifi
        #Tools
        alejandra
        protonvpn-gui
        lapce
        gitui
        nil
        clang
        mold
        fenix.packages.${system}.default.toolchain
        fenix.packages.${system}.latest.rust-analyzer
        latest.firefox-nightly-bin
        (vscode-with-extensions.override {
          vscodeExtensions = with vscode-extensions; [
            jnoortheen.nix-ide
            arrterian.nix-env-selector
            ms-vsliveshare.vsliveshare
            rust-lang.rust-analyzer
            tamasfe.even-better-toml
          ];
        })
        #Others
        gnomeExtensions.appindicator
      ];
    };
  };
  services = {
    fwupd = {
      enable = true;
      extraRemotes = ["lvfs-testing"];
    };
    flatpak.enable = true;
    dbus.implementation = "broker";
    power-profiles-daemon.enable = false;
    thermald.enable = true; # Intel only
    tlp.enable = true;
  };
}