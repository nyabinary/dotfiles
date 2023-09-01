{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../shared
    ../modules
    ./hardware-configuration.nix
    inputs.nixos-hardware.nixosModules.framework-12th-gen-intel
  ];

  # Boot & Bootloader Options
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
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
  };
}
