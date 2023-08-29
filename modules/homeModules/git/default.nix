{
  lib,
  config,
  ...
}: {
  options.homeModules.git.enable = lib.mkEnableOption "";

  config = lib.mkIf config.homeModules.git.enable {
    programs.git = {
      enable = true;
      delta.enable = true;
      extraConfig = {
        "init" = {
          defaultBranch = "main";
        };
        "user" = {
          name = "Niko";
          email = "97130632+Nyabinary@users.noreply.github.com";
        };
        "push" = {
          autoSetupRemote = true;
        };
        "credential" = {
          helper = "store";
        };
      };
    };
  };
}
