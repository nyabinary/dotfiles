{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.homeModules.vscode;
in {
  options.homeModules.vscode = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    programs.vscode = {
      package = pkgs.vscode;
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        arrterian.nix-env-selector
        ms-vsliveshare.vsliveshare
        rust-lang.rust-analyzer
        tamasfe.even-better-toml
        editorconfig.editorconfig
      ];
    };
  };
}
