{ pkgs, ... }:
{
  xdg = {
    portal = {
      extraPortals = [
        pkgs.xdg-desktop-portal-gnome
        pkgs.xdg-desktop-portal-gtk
      ];
      configPackages = [ pkgs.gnome-session ];
    };
  };
}
