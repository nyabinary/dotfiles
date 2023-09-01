{
  lib,
  config,
  ...
}: {
  options.systemModules.network.enable = lib.mkEnableOption "";

  config = lib.mkIf config.systemModules.network.enable {
    networking = {
      hostName = "binary";
      wireless.enable = false;
      wireless.iwd.enable = true;
      networkmanager.enable = true;
      networkmanager.wifi.backend = "iwd";
    };
  };
}
