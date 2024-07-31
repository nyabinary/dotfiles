{ lib, pkgs, ... }:
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
        disable-unfocused-render = true;
      };
      keyboard = {
        use-kitty-keyboard-protocol = true;
      };
      shell = {
        program = (lib.getExe pkgs.nushell);
        args = [ ];
      };
    };
  };
}
