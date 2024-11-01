{ config, lib, ... }:
let
  cfg = config.homeModules.thunderbird;
in
{
  options.homeModules.thunderbird = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    programs.thunderbird = {
      enable = true;
    };
  };
}
