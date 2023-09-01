{...}: {
  imports = [
    ../../modules
  ];

  systemModules = {
    rust.enable = true;
    i18n = {
      enable = true;
      locale = "en_US.UTF-8";
    };
  };
}
