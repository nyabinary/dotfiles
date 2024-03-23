{
  config,
  lib,
  version,
  ...
}: let
  cfg = config.baseModules.system;
in {
  options.baseModules.system = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    system = {
      activatable = true;
      #etc = {
      #  overlay = {
      #    enable = true;
      #    mutable = true;
      #  };
      #};
      stateVersion = version;
      switch = {
        enable = true;
      };
    };
  };
}
