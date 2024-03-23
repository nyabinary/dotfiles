{pkgs, ...}: {
  gtk = {
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    iconTheme = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
    };

    cursorTheme = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
    };
  };
  dconf.settings = {
    # Prefer Dark Theme
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    # Configure Extensions
    "org/gnome/shell" = {
      disable-user-extensions = false;

      # `gnome-extensions list` for a list
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "clipboard-history@alexsaveau.dev"
      ];
    };
    "org/gnome/desktop/peripherals/touchpad" = {
      # Configure Touchpad
      disable-while-typing = false;
    };
  };

  home.packages = with pkgs; [
    gnomeExtensions.appindicator # App Indicator
    gnomeExtensions.clipboard-history # Clipboard History
  ];
}
