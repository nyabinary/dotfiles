{ ... }:
{
  home = {
    sessionVariables = {
      VISUAL = "hx";
    };
    shellAliases = {
      switch = "sudo nixos-rebuild switch";
      boot = "sudo nixos-rebuild boot";
    };
  };
}
