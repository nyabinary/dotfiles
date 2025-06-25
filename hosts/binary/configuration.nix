{ pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  # Enable the GNOME & X11 windowing system
  # Enable BTRFS autoscrubbing
  services = {
    displayManager = {
      gdm = {
        enable = true;
        wayland = true;
      };
    };
    desktopManager = {
      gnome.enable = true;
    };
    openssh = {
      enable = true;
      startWhenNeeded = true;
    };
  };

  # sops-nix
  sops = {
    defaultSopsFile = ./secrets/binary.yaml;
    defaultSopsFormat = "yaml";
    age = {
      keyFile = "/home/nyan/.config/sops/age/keys.txt";
      generateKey = true;
    };
    secrets = {
      users_binary_password = {
        neededForUsers = true;
        format = "yaml";
        sopsFile = ./secrets/binary.yaml;
      };
      users_binary_languagetool_api_key = {
        format = "yaml";
        sopsFile = ./secrets/binary.yaml;
      };
      users_binary_email = {
        format = "yaml";
        sopsFile = ./secrets/binary.yaml;
      };
    };
  };

  # Exclude certain Gnome packages
  environment.gnome.excludePackages = with pkgs; [
    epiphany # web browser
    gnome-console
    gnome-music
    gnome-system-monitor
  ];

  xdg.terminal-exec = {
    package = pkgs.xdg-terminal-exec-mkhl;
    enable = true;
    settings = {
      GNOME = [ "com.mitchellh.ghostty.desktop" ];
    };
  };

  programs = {
    steam = {
      enable = true;
      gamescopeSession = {
        enable = true;
      };
      extest = {
        enable = true;
      };
    };
    mtr = {
      enable = true;
    };
    appimage = {
      enable = true;
      binfmt = true;
    };
    kdeconnect = {
      package = pkgs.gnomeExtensions.gsconnect;
      enable = true;
    };
  };

  hardware.framework = {
    enableKmod = false;
  };
}
