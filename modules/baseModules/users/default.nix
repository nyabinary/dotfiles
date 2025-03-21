{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.baseModules.users;
in
{
  options.baseModules.users = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    users = {
      defaultUserShell = pkgs.nushell;
      mutableUsers = false;
    };
    environment.shells = [ pkgs.nushell ];
  };
}
