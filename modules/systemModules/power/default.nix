{
  lib,
  config,
  ...
}: {
  options.systemModules.power.enable = lib.mkEnableOption "";
  options.systemModules.power.isIntel = lib.mkEnableOption "";
  options.systemModules.power.useTLP = lib.mkEnableOption "";

  config = lib.mkIf config.systemModules.power.enable {
    services = {
      power-profiles-daemon.enable = !config.systemModules.power.useTLP;
      thermald.enable = config.systemModules.power.isIntel; # Intel only
      tlp.enable = config.systemModules.power.useTLP; # Laptop/Power Savings
    };
  };
}
