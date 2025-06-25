{ ... }:
{
  home = {
    sessionVariables = {
      EDITOR = "hx";
      VISUAL = "hx";
    };
    shellAliases = {
      switch = "sudo nixos-rebuild switch --flake ~/.config/nyx";
      boot = "sudo nixos-rebuild boot --flake ~/.config/nyx";
    };
  };
}
