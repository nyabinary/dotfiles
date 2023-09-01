{
  lib,
  pkgs,
  config,
  inputs,
  ...
}: {
  options.systemModules.dbus.nyan.enable = lib.mkEnableOption "";
  options.systemModules.dbus.binary.enable = lib.mkEnableOption "";

  config = lib.mkMerge [
    #(lib.mkIf config.systemModules.NAME.FW16.enable {
    #module

    #})
    (lib.mkIf config.systemModules.dbus.binary.enable {
      service.dbus = {
        implementation = "broker";
      };
    })
  ];
}
