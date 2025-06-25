{
  config,
  pkgs,
  name,
  ...
}:
{
  users = {
    users = {
      ${name} = {
        isNormalUser = true;
        description = "Niko Cantero";
        extraGroups = [
          "networkmanager"
          "wheel"
          "dialout"
        ];
        hashedPasswordFile = config.sops.secrets.users_binary_password.path;
        packages = [
          # Entertainment
          pkgs.fractal
          pkgs.legcord
          pkgs.telegram-desktop
          pkgs.halloy # IRC
          pkgs.tidal-hifi
          pkgs.high-tide
          pkgs.heroic # Heroic Launcher
          pkgs.airshipper # Veloren
          pkgs.prismlauncher # Minecraft
          pkgs.slack
          pkgs.luanti
          pkgs.flare-signal
          pkgs.principia
          #Tools
          pkgs.protonvpn-gui # VPN
          pkgs.nil # For VSCode
          pkgs.blender-hip
          # pkgs.zrythm
          pkgs.fragments
          pkgs.resources
          pkgs.mousai
          pkgs.gnome-solanum
          pkgs.easyeffects
          pkgs.fw-ectool
          pkgs.fastfetch
          pkgs.anki
          pkgs.affine
          pkgs.arduino-ide
          # For reviewing nixpkgs prs:
          pkgs.nixpkgs-review
          pkgs.nix-output-monitor
          pkgs.bubblewrap
        ];
      };
    };
  };
}
