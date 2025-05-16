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
      settings = {
        buffer_editor = lib.getExe pkgs.helix;
        show_banner = false;
        use_kitty_protocol = true;
      };
      environmentVariables = {
        NIXOS_OZONE_WL = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
      };
    };
    home = {
      sessionVariables = {
        NIXOS_OZONE_WL = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
      };
    };

  };
}
