{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.homeModules.vscode;
in
{
  options.homeModules.vscode = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      mutableExtensionsDir = true;
      extensions = with pkgs.vscode-extensions; [
        editorconfig.editorconfig
        github.codespaces
        jnoortheen.nix-ide
        mkhl.direnv
        ms-vscode-remote.remote-containers
        ms-vsliveshare.vsliveshare
        rust-lang.rust-analyzer
        tamasfe.even-better-toml
        thenuprojectcontributors.vscode-nushell-lang
      ];
    };
  };
}
