{ config, lib, ... }:
let
  cfg = config.homeModules.element-desktop;
in
{
  options.homeModules.element-desktop = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    programs.element-desktop = {
      enable = true;
    };
  };
}
