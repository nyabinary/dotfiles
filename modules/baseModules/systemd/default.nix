{ config, lib, ... }:
let
  cfg = config.baseModules.systemd;
in
{
  options.baseModules.systemd = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    systemd = {
      enableCgroupAccounting = true;
      enableEmergencyMode = true;
      enableUnifiedCgroupHierarchy = true;
      oomd = {
        enable = true;
        enableRootSlice = true;
        enableSystemSlice = true;
        enableUserSlices = true;
      };
      #sysusers = {
      #  enable = true;
      #};
    };
  };
}
