{ ... }:
{
  programs.firefox = {
    languagePacks = [ "en-US" ];
    policies = {
      AllowFileSelectionDialogs = true;
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      BlockAboutAddons = false;
      BlockAboutConfig = false;
      BlockAboutProfiles = false;
      BlockAboutSupport = false;
      Cookies = {
        Allow = [
          "https://amazon.com/"
          "https://bsky.app/"
          "https://codeberg.org/"
          "https://duckduckgo.com/"
          "https://github.com/"
          "https://gitlab.com/"
          "https://google.com/"
          "https://languagetool.org/"
          "https://lemmy.ml/"
          "https://mastodon.online/"
          "https://nixos.org/"
          "https://phoronix.com/"
          "https://reddit.com/"
          "https://sr.ht/"
          "https://twitch.tv/"
          "https://wikipedia.org/"
          "https://x.com/"
          "https://youtube.com/"
        ];
        Behavior = "reject-tracker-and-partition-foreign";
        BehaviorPrivateBrowsing = "reject-tracker-and-partition-foreign";
        Locked = true;
      };
      DisableFirefoxStudies = true;
      DisableForgetButton = false;
      DisableFormHistory = true;
      DisablePocket = false;
      DisableTelemetry = true;
      DisplayBookmarksToolbar = "newtab";
      DisplayMenuBar = "default-off";
      DNSOverHTTPS = {
        Enabled = true;
        Fallback = true;
        Locked = true;
        ProviderURL = "https://dns11.quad9.net/dns-query";
      };
      DontCheckDefaultBrowser = true;
      EnableTrackingProtection = {
        Cryptomining = true;
        EmailTracking = true;
        Fingerprinting = true;
        Locked = true;
        Value = true;
      };
      EncryptedMediaExtensions = {
        Enabled = true;
        Locked = true;
      };
      ExtensionSettings = {
        "languagetool-webextension@languagetool.org" = {
          default_area = "navbar";
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/languagetool-webextension@languagetool.org/latest.xpi";
          private_browsing = false;
          updates_disabled = false;
        };
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          default_area = "navbar";
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/{446900e4-71c2-419f-a6a7-df9c091e268b}/latest.xpi";
          private_browsing = true;
          updates_disabled = false;
        };
        "magnolia@12.34" = {
          default_area = "menubar";
          installation_mode = "normal_installed";
          install_url = "https://gitflic.ru/project/magnolia1234/bpc_uploads/blob/raw?file=bypass_paywalls_clean-latest.xpi";
          private_browsing = false;
          updates_disabled = false;
        };
        "uBlock0@raymondhill.net" = {
          default_area = "menubar";
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/uBlock0@raymondhill.net/latest.xpi";
          private_browsing = true;
          updates_disabled = false;
        };
      };
      ExtensionUpdate = true;
      FirefoxHome = {
        Highlights = false;
        Pocket = true;
        Search = true;
        SponsoredPocket = false;
        SponsoredTopSites = false;
        TopSites = true;
        Locked = true;
      };
      FirefoxSuggest = {
        ImproveSuggest = false;
        Locked = true;
        SponsoredSuggestions = false;
        WebSuggestions = true;
      };
      HardwareAcceleration = true;
      Homepage = {
        Locked = true;
        StartPage = "homepage";
        URL = "about:home";
      };
      HttpsOnlyMode = "enabled";
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      PasswordManagerEnabled = false;
      PictureInPicture = {
        Enabled = true;
        Locked = true;
      };
      PostQuantumKeyAgreementEnabled = true;
      Preferences = {
        "browser.ml.chat.enabled" = {
          Status = "default";
          Value = true;
        };
        "browser.ml.chat.provider" = {
          Status = "default";
          Value = "https://chatgpt.com";
        };
        "browser.theme.content-theme" = {
          Status = "default";
          Value = 2;
        };
        "browser.theme.toolbar-theme" = {
          Status = "default";
          Value = 2;
        };
        "extensions.activeThemeID" = {
          Status = "default";
          Value = "firefox-compact-dark@mozilla.org";
        };
        "media.webrtc.camera.allow-pipewire" = {
          Status = "default";
          Value = true;
        };
        "privacy.globalprivacycontrol.enabled" = {
          Status = "default";
          Value = true;
        };
        "widget.use-xdg-desktop-portal.file-picker" = {
          Status = "default";
          Value = 1;
        };
        "widget.use-xdg-desktop-portal.location" = {
          Status = "default";
          Value = 1;
        };
        "widget.use-xdg-desktop-portal.mime-handler" = {
          Status = "default";
          Value = 1;
        };
        "widget.use-xdg-desktop-portal.native-messaging" = {
          Status = "default";
          Value = 1;
        };
        "widget.use-xdg-desktop-portal.open-uri" = {
          Status = "default";
          Value = 1;
        };
        "widget.use-xdg-desktop-portal.settings" = {
          Status = "default";
          Value = 1;
        };
        "widget.wayland.fractional-scale.enabled" = {
          Status = "default";
          Value = 1;
        };
      };
      PrimaryPassword = true;
      PrintingEnabled = true;
      PrivateBrowsingModeAvailability = 0;
      PromptForDownloadLocation = true;
      SanitizeOnShutdown = {
        Cache = true;
        Cookies = true;
        FormData = true;
        History = true;
        Locked = true;
        Sessions = true;
        SiteSettings = true;
      };
      SearchSuggestEnabled = true;
      ShowHomeButton = true;
      StartDownloadsInTempDirectory = false;
      TranslateEnabled = true;
      UserMessaging = {
        ExtensionRecommendations = false;
        FeatureRecommendations = false;
        FirefoxLabs = true;
        Locked = true;
        MoreFromMozilla = false;
        SkipOnboarding = false;
        UrlbarInterventions = true;
      };
    };
    profiles = {
      Niko = {
        id = 0;
        isDefault = true;
        name = "nyanbinary";
        search = {
          default = "ddg";
          force = true;
          privateDefault = "ddg";
        };
        settings = {
          "cookiebanners.service.mode" = 1;
          "cookiebanners.service.mode.privateBrowsing" = 1;
          "image.jxl.enabled" = true;
          "privacy.fingerprintingProtection" = true;
          "sidebar.revamp" = true;
        };
      };
    };
  };
}
