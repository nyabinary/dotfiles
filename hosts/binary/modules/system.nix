{...}: {
  imports = [
    ../../../modules/systemModules
  ];

  systemModules = {
    bluetooth.enable = true;
    dbus.enable = true;
    flatpak.enable = true;
    fwupd.enable = true;
    i18n = {
      enable = true;
      locale = "en_US.UTF-8";
    };
    network.enable = true;
    pipewire.enable = true;
    power.enable = true;
    printing.enable = true;
    rust.enable = true;
  };
}
