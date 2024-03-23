{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.homeModules.discord;
in {
  options.homeModules.discord = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.armcord
    ];
  };
}
