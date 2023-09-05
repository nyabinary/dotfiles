{
  pkgs,
  inputs,
  version,
  ...
}: {
  # Set system state version
  system.stateVersion = version;

  imports = [
    ../default.nix
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.framework-12th-gen-intel
  ];

  # Boot & Bootloader Options
  boot = {
    kernelPackages = pkgs.linuxPackages_latest; # Use latest stable Linux
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  # Enable networking
  networking = {
    hostName = "nyanbinary";
    networkmanager.enable = true;
  };

  # Set your time zone
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system
  services.xserver = {
    enable = true;
    layout = "us";
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # Enable CUPS to print documents
  services.printing.enable = true;

  # Enable sound with pipewire
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Define user account
  users.users.nyanbinary = {
    isNormalUser = true;
    description = "Niko Cantero";
    extraGroups = ["networkmanager" "wheel"];
  };
}
