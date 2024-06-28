{ ... }:
{
  programs.rio = {
    settings = {
      cursor = "▇";
      editor = "hx";
      blinking-cursor = false;
      hide-cursor-when-typing = true;
      ignore-selection-foreground-color = false;
      use-fork = true;
      renderer = {
        performance = "High";
        backend = "Automatic";
        disable-renderer-when-unfocused = true;
      };
    };
  };
}
