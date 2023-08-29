{
  lib,
  config,
  ...
}: {
  options.homeModules.helix.enable = lib.mkEnableOption "";

  config = lib.mkIf config.homeModules.helix.enable {
    programs.helix = {
      enable = true;
      settings = {
        theme = "catppuccin_mocha";
        editor = {
          line-number = "relative";
          lsp.display-messages = true;
        };
      };
    };
  };
}
