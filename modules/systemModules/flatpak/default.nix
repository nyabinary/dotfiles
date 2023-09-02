{
  lib,
  config,
  pkgs,
  ...
}: {
  options.systemModules.flatpak.enable = lib.mkEnableOption "";

  config = lib.mkIf config.systemModules.flatpak.enable {
    xdg = {
      portal = {
        enable = true;
        extraPortals = with pkgs; [
          xdg-desktop-portal
          xdg-desktop-portal-gtk
        ];
      };
    };
    services.flatpak = {
      enable = true;
    };
  };
}
