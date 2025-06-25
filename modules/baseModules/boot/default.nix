{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.baseModules.boot;
in
{
  options.baseModules.boot = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    boot = {
      kernelPackages = pkgs.linuxPackages_testing; # Use latest stable Linux (pkgs.linuxPackages_latest) pkgs.linuxKernel.packages.linux_6_14
      initrd = {
        systemd = {
          enable = true;
        };
        verbose = true;
      };
      loader = {
        efi = {
          canTouchEfiVariables = true;
        };
        systemd-boot = {
          enable = true;
          editor = false;
        };
      };
      tmp = {
        useTmpfs = true;
        cleanOnBoot = true;
      };
    };
  };
}
