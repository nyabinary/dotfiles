{ config, lib, ... }:
let
  cfg = config.homeModules.zed-editor;
in
{
  options.homeModules.zed-editor = {
    enable = lib.mkEnableOption "";
  };

  config = lib.mkIf cfg.enable {
    programs.zed-editor = {
      enable = true;
      extensions = [
        "html"
        "catppuccin"
        "catppuccin-icons"
        "nix"
        "nu"
        "zig"
      ];
      # themes = {
      #   ./Catppuccin-Mocha;
      # };
      userSettings = {
        autosave = "on_focus_change";
        confirm_quit = true;
        lsp = {
          rust-analyzer = {
            initialization_options = {
              check = {
                command = "clippy";
              };
              checkOnSave = true;
              diagnostics = {
                experimental = {
                  enable = true;
                };
                styleLints = {
                  enable = true;
                };
              };
              inlayHints = {
                closureReturnTypeHints = {
                  enable = "with_block";
                };
                lifetimeElisionHints = {
                  enable = "skip_trivial";
                  useParameterNames = true;
                };
              };
              interpret = {
                tests = true;
              };
              rustfmt = {
                rangeFormatting = {
                  enable = true;
                };
              };
            };
          };
        };
        format_on_save = "on";
        diagnostics = {
          include_warnings = true;
          inline = {
            enabled = true;
          };
          update_with_cursor = false;
          primary_only = false;
          use_rendered = false;
        };
        inlay_hints = {
          enabled = true;
        };
        tabs = {
          close_position = "right";
          file_icons = true;
          git_status = true;
          activate_on_close = "history";
          always_show_close_button = false;
        };
        telemetry = {
          diagnostics = false;
          metrics = false;
        };
        theme = {
          mode = "system";
          light = "Catppuccin Latte";
          dark = "Catppuccin Mocha";
        };
        icon_theme = {
          mode = "system";
          light = "Catppuccin Latte";
          dark = "Catppuccin Mocha";
        };
      };
    };
  };
}
