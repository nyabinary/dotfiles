{
  lib,
  config,
  ...
}: {
  options.systemModules.rust.enable = lib.mkEnableOption "";

  config = lib.mkIf config.systemModules.rust.enable {
    users.users.nyanbinary.packages = with pkgs; [
      mold
      clang
      inputs.fenix.packages.${system}.default.toolchain
      inputs.fenix.packages.${system}.latest.rust-analyzer
    ];
  };
}
