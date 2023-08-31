{
  lib,
  pkgs,
  config,
  inputs,
  ...
}: {
  options.systemModules.i18n.enable = lib.mkEnableOption "";
  options.systemModules.i18n.locale = lib.mkOption {
    default = "en_US.UTF-8";
    type = lib.types.str;
  };

  config =  let 
    locale = config.systemModules.i18n.locale;
  in lib.mkIf config.systemModules.i18n.enable {
    i18n = {
      defaultLocale = locale;
      extraLocaleSettings = {
        LC_ADDRESS = locale;
        LC_IDENTIFICATION = locale;
        LC_MEASUREMENT = locale;
        LC_MONETARY = locale;
        LC_NAME = locale;
        LC_NUMERIC = locale;
        LC_PAPER = locale;
        LC_TELEPHONE = locale;
        LC_TIME = locale;
      };
    };
  };
}
