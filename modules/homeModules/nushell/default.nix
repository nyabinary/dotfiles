{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.homeModules.nushell;
in
{
  options.homeModules.nushell = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    programs.nushell = {
      enable = true;
      environmentVariables = {
        NIXOS_OZONE_WL = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
      };
      extraConfig = ''
        $env.config = {
          show_banner: false,
        }
      '';
    };
    home = {
      sessionVariables = {
        NIXOS_OZONE_WL = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
      };
    };
  };
}
