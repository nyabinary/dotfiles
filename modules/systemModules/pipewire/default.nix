{
  lib,
  config,
  ...
}: {
  options.systemModules.pipewire.enable = lib.mkEnableOption "";

  config = lib.mkIf config.systemModules.pipewire.enable {
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
