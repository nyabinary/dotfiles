{ config, lib, ... }:
let
  cfg = config.homeModules.ghostty;
in
{
  options.homeModules.ghostty = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    programs.ghostty = {
      enable = true;
    };
  };
}
