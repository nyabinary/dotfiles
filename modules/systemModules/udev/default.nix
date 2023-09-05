{
  lib,
  config,
  ...
}: {
  options.systemModules.udev.enable = lib.mkEnableOption "";

  config = lib.mkIf config.systemModules.udev.enable {
    services.udev.extraRules = ''
      SUBSYSTEM=="usb", ATTRS{idVendor}=="2e8a", ATTRS{idProduct}=="fedd", MODE="666"
    '';
  };
}
