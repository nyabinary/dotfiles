{
  lib,
  config,
  ...
}: {
  options.systemModules.power.nyan.enable = lib.mkEnableOption "";
  options.systemModules.power.binary.enable = lib.mkEnableOption "";

  config = lib.mkMerge [
    #(lib.mkIf config.systemModules.NAME.FW16.enable {
    #module

    #})
    (lib.mkIf config.systemModules.power.binary.enable {
      services = {
        power-profiles-daemon.enable = false;
        thermald.enable = true; # Intel only
        tlp.enable = true; # Laptop/Power Savings
      };
    })
  ];
}
