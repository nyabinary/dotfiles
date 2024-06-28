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
        ];
        hashedPasswordFile = config.sops.secrets.users_nyan_password.path;
        packages = [
          #Entertainment
          pkgs.element-desktop
          pkgs.goofcord
          pkgs.telegram-desktop
          pkgs.zulip
          pkgs.tidal-hifi
          pkgs.heroic # Heroic Launcher
          pkgs.osu-lazer-bin # Osu!
          pkgs.foliate # eBooks
          pkgs.airshipper # Veloren
          pkgs.prismlauncher # Minecraft
          #Tools
          pkgs.protonvpn-gui # VPN
          pkgs.nil # For VSCode
          pkgs.nix-init
          pkgs.blender
          pkgs.zrythm
          pkgs.fragments
          pkgs.arduino-ide
          #Others
          pkgs.zoom-us
          #pkgs.teams-for-linux
          pkgs.geopard
        ];
      };
    };
  };
}
