{
  lib,
  pkgs,
  config,
  inputs,
  ...
}: {
  options.systemModules.printing.nyan.enable = lib.mkEnableOption "";
  options.systemModules.printing.binary.enable = lib.mkEnableOption "";

  config = lib.mkMerge [
    #(lib.mkIf config.systemModules.NAME.FW16.enable {
    #module

    #})
    (lib.mkIf config.systemModules.printing.binary.enable {
      service.printing = {
        enable = true;
        startWhenNeeded = true;
      };
    })
  ];
}