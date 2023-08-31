{
  lib,
  config,
  pkgs,
  ...
}: {
  options.systemModules.network.binary.enable = lib.mkEnableOption "";
  options.systemModules.network.nyan.enable = lib.mkEnableOption "";

  config = lib.mkMerge [
    (lib.mkIf config.systemModules.network.binary.enable {
      networking = {
        hostName = "binary";
        wireless.iwd.enable = true;
        networkmanager.enable = true;
        networkmanager.wifi.backend = "iwd";
      };
    })
    (lib.mkIf config.systemModules.network.nyan.enable {
      #module - nyan
    })
  ];
}
