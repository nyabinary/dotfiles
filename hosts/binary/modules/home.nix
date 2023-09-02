{...}: {
  imports = [
    ../../../modules/homeModules
  ];

  # State version
  home.stateVersion = "23.11";
  nixpkgs.config.allowUnfree = true;

  # Home modules
  homeModules = {
    git.enable = true;
    direnv.enable = true;
    vscode.enable = true;
    nushell.enable = true;
    helix.enable = true;
    gitui.enable = true;
    firefox.enable = true;
  };
}
