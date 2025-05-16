{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.homeModules.foliate;
in
{
  options.homeModules.foliate = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    programs.foliate = {
      package = pkgs.foliate;
      enable = true;
    };
  };
}
