{...}: {
  programs.vscode = {
    userSettings = {
      "diffEditor.experimental.showMoves" = true;
      "editor.experimental.asyncTokenization" = true;
      "editor.formatOnPaste" = true;
      "editor.formatOnSave" = true;
      "editor.smoothScrolling" = true;
      "http.experimental.systemCertificatesV2" = true;
      "js/ts.implicitProjectConfig.experimentalDecorators" = true;
      "multiDiffEditor.experimental.enabled" = true;
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "notebook.experimental.cellChat" = true;
      "notebook.globalToolbarShowLabel" = "dynamic";
      "notebook.stickyScroll.enabled" = true;
      "rust-analyzer.check.command" = "clippy";
      "rust-analyzer.diagnostics.experimental.enable" = true;
      "rust-analyzer.inlayHints.lifetimeElisionHints.enable" = "skip_trivial";
      "rust-analyzer.interpret.tests" = true;
      "rust-analyzer.restartServerOnConfigChange" = true;
      "rust-analyzer.rustfmt.rangeFormatting.enable" = true;
      "search.experimental.closedNotebookRichContentResults" = true;
      "search.experimental.quickAccess.preserveInput" = true;
      "telemetry.telemetryLevel" = "off";
      "terminal.external.linuxExec" = "rio";
      "terminal.integrated.defaultProfile.linux" = "Nushell";
      "terminal.integrated.shellIntegration.suggestEnabled" = true;
      "terminal.integrated.smoothScrolling" = true;
      "terminal.integrated.stickyScroll.enabled" = true;
      "timeline.pageOnScroll" = true;
      "typescript.experimental.tsserver.web.typeAcquisition.enabled" = true;
      "typescript.tsserver.experimental.enableProjectDiagnostics" = true;
      "window.autoDetectColorScheme" = true;
      "workbench.accounts.experimental.showEntitlements" = true;
      "workbench.commandPalette.experimental.suggestCommands" = true;
      "workbench.experimental.cloudChanges.autoStore" = "onShutdown";
      "workbench.experimental.cloudChanges.partialMatches.enabled" = true;
      "workbench.experimental.share.enabled" = true;
      "workbench.list.smoothScrolling" = true;
      "git.enableCommitSigning" = true;
    };
  };
}
