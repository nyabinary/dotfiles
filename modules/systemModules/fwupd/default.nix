{
  lib,
  config,
  ...
}: {
  options.systemModules.fwupd.enable = lib.mkEnableOption "";

  config = lib.mkIf config.systemModules.fwupd.enable {
    services.fwupd = {
      enable = true;
      extraRemotes = ["lvfs-testing"];
    };
  };
}
