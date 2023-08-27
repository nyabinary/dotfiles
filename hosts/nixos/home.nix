{
  pkgs,
  inputs,
  ...
}: {
  home.stateVersion = "23.11";

  # Configure programs
  programs = {
    nushell = {
      enable = true;
      shellAliases = {
        switch = "sudo nixos-rebuild switch --impure";
      };
      environmentVariables = {
        EDITOR = "hx";
        VISUAL = "bat";
      };
      configFile.text = ''
        $env.config = {
          show_banner: false,
        }
      '';
    };
    git = {
      enable = true;
      delta.enable = true;
      extraConfig = {
        "init" = {
          defaultBranch = "main";
        };
        "user" = {
          name = "Niko";
          email = "97130632+Nyabinary@users.noreply.github.com";
        };
        "push" = {
          autoSetupRemote = true;
        };
        "credential" = {
          helper = "store";
        };
      };
    };
    helix = {
      enable = true;
      settings = {
        theme = "catppuccin_mocha";
        editor = {
          line-number = "relative";
          lsp.display-messages = true;
        };
      };
    };
    # vscode = {
    #   enable = true;
    # };
    autojump = {
      enable = true;
    };
    bat = {
      enable = true;
    };
  };
}
