{
  lib,
  config,
  pkgs,
  ...
}: {
  options.systemModules.direnv.enable = lib.mkEnableOption "";

  config = lib.mkIf config.systemModules.direnv.enable {
    programs.direnv = {
      package = pkgs.direnv;
      silent = false;
      persistDerivations = true;
      loadInNixShell = true;
      nix-direnv = {
        enable = true;
        package = pkgs.nix-direnv;
      };
    };
  };
}
