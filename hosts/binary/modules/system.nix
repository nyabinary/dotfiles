{...}: {
  imports = [
    ../../../modules/systemModules
  ];

  systemModules = {
    bluetooth.binary.enable = true;
    dbus.binary.enable = true;
    flatpak.binary.enable = true;
    fwupd.binary.enable = true;
    i18n = {
      enable = true;
      locale = "en_US.UTF-8";
    };
    network.binary.enable = true;
    pipewire.binary.enable = true;
    power.binary.enable = true;
    printing.binary.enable = true;
    rust.enable = true;
  };
}
