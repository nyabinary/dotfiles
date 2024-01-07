{
  config,
  lib,
  ...
}: let
  cfg = config.homeModules.nushell;
in {
  options.homeModules.nushell = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    programs.nushell = {
      enable = true;
      extraConfig = ''
        $env.config = {
          show_banner: false,
        }
      '';
    };
  };
}
