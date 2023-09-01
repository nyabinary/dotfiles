{
  lib,
  config,
  ...
}: {
  options.systemModules.printing.enable = lib.mkEnableOption "";

  config = lib.mkIf config.systemModules.printing.enable {
    services.printing = {
      enable = true;
      startWhenNeeded = true;
    };
  };
}
