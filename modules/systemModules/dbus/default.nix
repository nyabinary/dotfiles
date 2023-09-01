{
  lib,
  config,
  ...
}: {
  options.systemModules.dbus.enable = lib.mkEnableOption "";

  config = lib.mkIf config.systemModules.dbus.enable {
    services.dbus = {
      implementation = "broker";
    };
  };
}
