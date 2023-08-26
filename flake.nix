{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };
    mozilla = {
      url = "github:mozilla/nixpkgs-mozilla/master";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixos-hardware,
    mozilla,
    rust-overlay,
    ...
  } @ inputs: {
    nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ({
          config,
          pkgs,
          lib,
          ...
        }: {
          system.stateVersion = "23.11";

          imports = [
            ./hardware-configuration.nix
            nixos-hardware.nixosModules.framework-13th-gen-intel
          ];

          nixpkgs.overlays = [
            mozilla.overlay
            rust-overlay.overlays.default
          ];
          
          #NixOS Settings/Config
          nix = {
            settings = {
              experimental-features = ["auto-allocate-uids" "ca-derivations" "cgroups" "nix-command" "flakes"];
              auto-optimise-store = true;
              keep-derivations = true;
              keep-outputs = true;
              sandbox = true;
            };
            registry.nixpkgs.flake = inputs.nixpkgs;
            nixPath = ["nixpkgs=/etc/channels/nixpkgs" "nixos-config=/etc/nixos/configuration.nix" "/nix/var/nix/profiles/per-user/root/channels"];
          };
          environment.etc."channels/nixpkgs".source = inputs.nixpkgs.outPath;

          # Configure nixpkgs
          nixpkgs.config = {
            allowUnfree = true;
            firefox.speechSynthesisSupport = true;
          };

          # Boot & Bootloader Options
          boot.kernelPackages = pkgs.linuxPackages_latest; # Use latest stable Linux
          boot.loader.systemd-boot.enable = true;
          boot.loader.efi.canTouchEfiVariables = true;

          # Enable networking
          networking.hostName = "nixos";
          networking.networkmanager.enable = true;

          # Set your time zone
          time.timeZone = "America/New_York";

          # Select internationalisation properties.
          i18n.defaultLocale = "en_US.UTF-8";
          i18n.extraLocaleSettings = {
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

          # Manage git
          programs = {
            git = {
              enable = true;
              config = {
                init = {
                  defaultBranch = "main";
                };
                user = {
                  name = "Niko";
                  email = "97130632+Nyabinary@users.noreply.github.com";
                };
                push = {
                  autoSetupRemote = true;
                };
                credential = {
                  helper = "store";
                };
              };
            };
          };

          # Define user account
          users.defaultUserShell = pkgs.nushell;
          users.users.nyanbinary = {
            isNormalUser = true;
            description = "Niko Cantero";
            extraGroups = ["networkmanager" "wheel"];
            packages = with pkgs; [
              protonvpn-gui
              armcord
              gitui
              lapce
              helix
              armcord
              latest.firefox-nightly-bin
              rust-bin.nightly.latest.default
              telegram-desktop
              gnomeExtensions.appindicator
              steam
              (vscode-with-extensions.override {
                vscodeExtensions = with vscode-extensions; [
                  bbenoist.nix
                  ms-vsliveshare.vsliveshare
                  rust-lang.rust-analyzer
                ];
              })
            ];
          };
          # List packages installed in system profile
          # To find package name, go to https://search.nixos.org/packages
          # To find service name, go to https://search.nixos.org/options
          environment.systemPackages = with pkgs; [
          ];

          # Services
          services.fwupd.enable = true; # To update framework laptop firmware, run sudo fwupdmgr update
          services.thermald.enable = true;
          services.dbus.implementation = "broker";
          services.power-profiles-daemon.enable = false;
          services.tlp.enable = true;
        })
      ];
    };
  };
}
