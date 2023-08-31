{
  lib,
  config,
  ...
}: {
  options.homeModules.gitui.enable = lib.mkEnableOption "";

  config = lib.mkIf config.homeModules.gitui.enable {
    programs.gitui = {
      enable = true;
    };
  };
}
