{
  lib,
  pkgs,
  config,
  inputs,
  ...
}: {
  options.systemModules.network.nyan.enable = lib.mkEnableOption "";
  options.systemModules.network.binary.enable = lib.mkEnableOption "";

  config = lib.mkMerge [
    # (lib.mkIf config.systemModules.network.nyan.enable {
    #   module - nyan
    # })
    (lib.mkIf config.systemModules.network.binary.enable {
      networking = {
        hostName = "binary";
        wireless.enable = false;
        wireless.iwd.enable = true;
        networkmanager.enable = true;
        networkmanager.wifi.backend = "iwd";
      };
    })
  ];
}
