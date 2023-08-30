{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../modules/systemModules
    ../shared
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.framework-12th-gen-intel
  ];

  # System components
  systemModules = {
    rust.enable = true;
  };

  # Boot & Bootloader Options
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };

  # Hardware Options
  hardware = {
    pulseaudio.enable = false;
    bluetooth = {
      enable = true;
    };
  };

  # Enable networking
  networking = {
    hostName = "framework-13";
    wireless.iwd.enable = true;
    networkmanager.enable = true;
    networkmanager.wifi.backend = "iwd";
  };

  # Time Options
  time = {
    timeZone = "America/New_York";
    hardwareClockInLocalTime = false;
  };

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

  # rtkit is optional but recommended
  security.rtkit.enable = true;

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
        element-desktop
        telegram-desktop
        tidal-hifi
        #Tools
        alejandra
        protonvpn-gui
        nil
        latest.firefox-nightly-bin
        #Others
        gnomeExtensions.appindicator
      ];
    };
  };

  services = {
    # Enable the GNOME Desktop Environment.
    xserver = {
      enable = true;
      layout = "us";
      xkbVariant = "";
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
    # Enable sound with pipewire
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      jack.enable = true;
    };
    # Enable Firmware Updates
    fwupd = {
      enable = true;
      extraRemotes = ["lvfs-testing"];
    };
    # Enable CUPS to print documents
    printing = {
      enable = true;
      startWhenNeeded = true;
    };
    flatpak.enable = true;
    dbus.implementation = "broker";
    power-profiles-daemon.enable = false;
    thermald.enable = true; # Intel only
    tlp.enable = true; # Laptop/Power Savings
  };
}
