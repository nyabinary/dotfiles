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
    helix.enable = true;
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
        element-desktop
        telegram-desktop
        tidal-hifi
        #Tools
        alejandra
        protonvpn-gui
        lapce
        gitui
        nil
        latest.firefox-nightly-bin
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
