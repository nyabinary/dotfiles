{ config, lib, ... }:
let
  cfg = config.systemModules.printing;
in
{
  options.systemModules.printing = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    services.printing = {
      enable = true;
      stateless = true;
      startWhenNeeded = true;
      webInterface = true;
    };
  };
}
