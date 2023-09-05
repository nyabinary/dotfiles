{
  pkgs,
  inputs,
  version,
  name,
  ...
}: {
  # Set system state version
  system.stateVersion = version;

  imports = [
    ../default.nix
    ./hardware-configuration.nix
    ../../modules/systemModules
    inputs.nixos-hardware.nixosModules.framework-12th-gen-intel
  ];

  # Boot & Bootloader Options
  boot = {
    kernelPackages = pkgs.linuxPackages_latest; # Use latest stable Linux
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  # Set your time zone
  time.timeZone = "America/New_York";

  # Enable the X11 windowing system
  services.xserver = {
    enable = true;
    layout = "us";
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # Define user account
  users.users.${name} = {
    isNormalUser = true;
    description = "Niko Cantero";
    extraGroups = ["networkmanager" "wheel"];
  };
}
