{
  config,
  lib,
  ...
}: let
  cfg = config.systemModules.pipewire;
in {
  options.systemModules.pipewire = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    hardware.pulseaudio.enable = false;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
