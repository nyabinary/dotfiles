{...}: {
  # Import home modules
  imports = [
    ../../modules/homeModules
  ];

  # Configure home modules
  homeModules = {
    git.enable = true;
    direnv.enable = true;
    vscode.enable = true;
    nushell.enable = true;
    helix.enable = true;
    gitui.enable = true;
    # firefox.enable = true;
  };
}