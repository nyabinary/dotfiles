{
  lib,
  pkgs,
  config,
  inputs,
  ...
}: {
  options.systemModules.helix.enable = lib.mkEnableOption "";

  config = lib.mkIf config.systemModules.helix.enable {
    
  };
}
