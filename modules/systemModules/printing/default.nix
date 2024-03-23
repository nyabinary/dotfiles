{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.systemModules.printing;
in {
  options.systemModules.printing = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    services.printing = {
      enable = true;
      drivers = [pkgs.hplip];
      stateless = true;
      startWhenNeeded = true;
    };
  };
}
