{ ... }:
{
  programs.nushell = {
    environmentVariables = {
      MOZ_USE_XINPUT2 = "1";
      EDITOR = "hx";
      VISUAL = "hx";
      TERM = "rio";
    };
    shellAliases = {
      switch = "sudo nixos-rebuild switch";
      boot = "sudo nixos-rebuild boot";
    };
  };
  home = {
    sessionVariables = {
      MOZ_USE_XINPUT2 = "1";
      EDITOR = "hx";
      VISUAL = "hx";
      TERM = "rio";
    };
    shellAliases = {
      switch = "sudo nixos-rebuild switch";
      boot = "sudo nixos-rebuild boot";
    };
  };
}
