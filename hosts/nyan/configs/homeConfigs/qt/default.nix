{pkgs, ...}: {
  qt = {
    platformTheme = "gtk3";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };
}
