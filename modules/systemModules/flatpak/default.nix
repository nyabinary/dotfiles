{
  lib,
  config,
  ...
}: {
  options.systemModules.flatpak.nyan.enable = lib.mkEnableOption "";
  options.systemModules.flatpak.binary.enable = lib.mkEnableOption "";

  config = lib.mkMerge [
    #(lib.mkIf config.systemModules.NAME.FW16.enable {
    #module

    #})
    (lib.mkIf config.systemModules.flatpak.binary.enable {
      services.flatpak = {
        enable = true;
      };
    })
  ];
}
