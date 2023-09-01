{
  lib,
  config,
  ...
}: {
  options.systemModules.bluetooth.enable = lib.mkEnableOption "";

  config = lib.mkIf config.systemModules.bluetooth.enable {
    hardware.bluetooth = {
      enable = true;
    };
  };
}
