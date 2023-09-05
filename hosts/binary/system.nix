{...}: {
  # Import system modules
  imports = [
    ../../modules/systemModules
  ];

  # Configure system modules
  systemModules = {
    bluetooth.enable = true;
    dbus.enable = true;
    flatpak.enable = true;
    fwupd.enable = true;
    i18n.enable = true;
    sudnetwork.enable = true;
    pipewire.enable = true;
    power.enable = true;
    printing.enable = true;
    # udev.enable = true;
  };
}
