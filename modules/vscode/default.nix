{
  lib,
  pkgs,
  config,
  ...
}: {
  options.systemModules.vscode.enable = lib.mkEnableOption "";

  config = lib.mkIf config.systemModules.vscode.enable {
    users.users.nyanbinary.packages = with pkgs; [
        (vscode-with-extensions.override {
          vscodeExtensions = with vscode-extensions; [
            jnoortheen.nix-ide
            arrterian.nix-env-selector
            ms-vsliveshare.vsliveshare
            rust-lang.rust-analyzer
            tamasfe.even-better-toml
          ];
        })
    ];
  };
}
