{
  ...
}: {
  home.stateVersion = "23.11";

  # Configure programs
  programs = {
    direnv = {
      enable = true;
      enableNushellIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };

    nushell = {
      enable = true;
      shellAliases = {
        switch = "sudo nixos-rebuild switch --impure";
      };
      environmentVariables = {
        EDITOR = "hx";
        VISUAL = "lapce";
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
    bat = {
      enable = true;
    };
  };
}