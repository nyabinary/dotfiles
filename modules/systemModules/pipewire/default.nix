{
  lib,
  pkgs,
  config,
  inputs,
  ...
}: {
  options.systemModules.pipewire.nyan.enable = lib.mkEnableOption "";
  options.systemModules.pipewire.binary.enable = lib.mkEnableOption "";

  config = lib.mkMerge [
    #(lib.mkIf config.systemModules.NAME.FW16.enable {
    #module

    #})
    (lib.mkIf config.systemModules.pipewire.binary.enable {
      service.pipewire = {
        enable = true;
        alsa.enable = true;
        pulse.enable = true;
        jack.enable = true;
      };
    })
  ];
}
