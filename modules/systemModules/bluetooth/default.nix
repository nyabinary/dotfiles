{
  lib,
  config,
  ...
}: {
  options.systemModules.bluetooth.binary.enable = lib.mkEnableOption "";
  options.systemModules.bluetooth.nyan.enable = lib.mkEnableOption "";

  config = lib.mkMerge [
    (lib.mkIf config.systemModules.bluetooth.binary.enable {
      hardware.bluetooth = {
        enable = true;
      };
    })
    #(lib.mkIf config.systemModules.NAME.FW16.enable {
    #module

    #})
  ];
}
