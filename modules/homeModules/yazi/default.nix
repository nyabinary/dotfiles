{
  config,
  lib,
  ...
}: let
  cfg = config.homeModules.yazi;
in {
  options.homeModules.yazi = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    programs.yazi = {
      enable = true;
    };
  };
}
