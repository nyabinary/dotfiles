{ pkgs, ... }:
{
  gtk = {
    gtk3 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
      };
    };
  };
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      # Prefer Dark Theme
      color-scheme = "prefer-dark";
      # Configure Battery Icon in GNOME
      show-battery-percentage = true;
    };
    # Configure Extensions in GNOME
    "org/gnome/shell" = {
      disable-user-extensions = false;

      # `gnome-extensions list` for a list
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "clipboard-history@alexsaveau.dev"
        "gsconnect@andyholmes.github.io"
      ];
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      # Configure Touchpad in GNOME
      disable-while-typing = false;
    };
  };
  home.packages = [
    pkgs.gnomeExtensions.appindicator # App Indicator
    pkgs.gnomeExtensions.clipboard-history # Clipboard History
    pkgs.gnomeExtensions.gsconnect # KDE Connect
  ];
  services.polkit-gnome = {
    enable = true;
  };
}
