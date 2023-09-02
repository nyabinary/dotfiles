{
  lib,
  config,
  ...
}: {
  options.systemModules.pipewire.enable = lib.mkEnableOption "";

  config = lib.mkIf config.systemModules.pipewire.enable {
    hardware.pulseaudio.enable = false;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
