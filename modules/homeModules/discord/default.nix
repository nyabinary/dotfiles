{
  lib,
  config,
  pkgs,
  ...
}: {
  options.homeModules.discord.enable = lib.mkEnableOption "";

  config = lib.mkIf config.homeModules.discord.enable {
    home.packages = [
      (pkgs.discord-development.override {
        withOpenASAR = true;
        withVencord = true;
      }) 
    ];
  };
}