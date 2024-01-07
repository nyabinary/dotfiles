{
  config,
  pkgs,
  name,
  ...
}: {
  users = {
    users = {
      ${name} = {
        isNormalUser = true;
        description = "Niko Cantero";
        extraGroups = ["networkmanager" "wheel"];
        group = "users";
        hashedPasswordFile = config.sops.secrets.users_nyan_password.path;
        packages = [
          #Entertainment
          pkgs.element-desktop
          pkgs.telegram-desktop
          pkgs.tidal-hifi # Music
          pkgs.osu-lazer-bin # Osu!
          pkgs.vinegar # Roblox
          pkgs.prismlauncher #Minecraft
          #Tools
          pkgs.protonvpn-gui #VPN
          pkgs.nil # For VSCode
          pkgs.nix-init
          #Others
          pkgs.meld
          pkgs.zoom-us
          pkgs.teams-for-linux
          pkgs.geopard
        ];
      };
    };
  };
}
