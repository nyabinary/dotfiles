{ config, lib, ... }:
let
  cfg = config.systemModules.printing;
in
{
  options.systemModules.printing = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    services.printing = {
      enable = true;
      stateless = true;
      startWhenNeeded = true;
      webInterface = false;
    };
    hardware.sane = {
      enable = true;
    };
  };
}
