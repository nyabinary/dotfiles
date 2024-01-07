{...}: {
  programs.git = {
    delta.enable = true;
    extraConfig = {
      "user" = {
        name = "Niko";
        email = "97130632+Nyabinary@users.noreply.github.com";
      };
      "credential" = {
        helper = "store";
      };
    };
  };
}
