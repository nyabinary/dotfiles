{
  lib,
  config,
  inputs,
  ...
}: {
  options.homeModules.firefox.enable = lib.mkEnableOption "";

  config = lib.mkIf config.homeModules.firefox.enable {
    home.packages = [
      inputs.mozilla.packages.x86_64-linux.firefox-nightly-bin
    ];
  };
}