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
    i18n = {
      enable = true;
      locale = "en_US.UTF-8";
    };
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

  # Time Options
  time = {
    timeZone = "America/New_York";
    hardwareClockInLocalTime = false;
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
        #TEMP
        (pkgs.discord-development.override {
          # remove any overrides that you don't want
          withOpenASAR = true;
          withVencord = true;
        })
        #TEMP
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
