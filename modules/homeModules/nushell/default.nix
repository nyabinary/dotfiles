{
  lib,
  config,
  ...
}: {
  options.homeModules.nushell.enable = lib.mkEnableOption "";

  config = lib.mkIf config.homeModules.nushell.enable {
    programs.nushell = {
      enable = true;
      shellAliases = {
        switch = "sudo nixos-rebuild switch --impure";
      };
      environmentVariables = {
        EDITOR = "hx";
        VISUAL = "lapce";
      };
      configFile.text = ''
        $env.config = {
          show_banner: false,
        }
      '';
    };
  };
}
