{
  lib,
  config,
  ...
}: {
  options.systemModules.flatpak.enable = lib.mkEnableOption "";

  config = lib.mkIf config.systemModules.flatpak.enable {
    services.flatpak = {
      enable = true;
    };
  };
}
