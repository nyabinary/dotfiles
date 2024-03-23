{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  # Enable the GNOME & X11 windowing system
  # Enable BTRFS autoscrubbing
  services = with pkgs; {
    xserver = {
      excludePackages = [xterm];
      enable = true;
      xkb = {
        layout = "us";
      };
      displayManager = {
        gdm = {
          enable = true;
          wayland = true;
        };
      };
      desktopManager = {
        gnome.enable = true;
      };
    };
    btrfs = {
      autoScrub.enable = true;
    };
  };

  # sops-nix
  sops = {
    defaultSopsFile = ./secrets/nyan.yaml;
    age.keyFile = "/home/binary/.config/sops/age/keys.txt";
    secrets.users_nyan_password.neededForUsers = true;
  };

  # Exclude certain Gnome packages
  environment.gnome.excludePackages = with pkgs; [
    epiphany # web browser
    gnome-console
  ];

  environment.systemPackages = with pkgs; [
    (linkFarm "xdg-terminal-exec" {"bin/xdg-terminal-exec" = "${rio}/bin/rio";})
  ];

  nixpkgs.overlays = [
    (final: prev: {
      fprintd = (prev.fprintd.overrideAttrs) (_: {
        mesonCheckFlags = [
          "--no-suite"
          "fprintd:TestPamFprintd"
        ];
      });
    })
  ];

  programs.steam = {
    enable = true;
    gamescopeSession = {
      enable = true;
    };
  };
}
