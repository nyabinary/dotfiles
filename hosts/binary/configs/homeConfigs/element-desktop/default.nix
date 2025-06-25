{ ... }:
{
  programs.element-desktop = {
    settings = {
      default_country_code = "US";
      default_theme = "dark";
      default_server_config = {
        "m.homeserver" = {
          base_url = "https://matrix.nyanbinary.rs/";
          server_name = "nyanbinary.rs";

        };
        "m.identity_server" = {
          base_url = "https://vector.im/";
        };
      };
      disable_custom_urls = false;
      disable_guests = false;
      disable_login_language_selector = false;
      disable_3pid_login = false;
      force_verification = false;
      brand = "Element";
      integrations_ui_url = "https://scalar.vector.im/";
      integrations_rest_url = "https://scalar.vector.im/api";
      integrations_widgets_urls = [
        "https://scalar.vector.im/_matrix/integrations/v1"
        "https://scalar.vector.im/api"
        "https://scalar-staging.vector.im/_matrix/integrations/v1"
        "https://scalar-staging.vector.im/api"
        "https://scalar-staging.riot.im/scalar/api"
      ];
      show_labs_settings = true;
      room_directory = {
        servers = [
          "matrix.org"
          "mozilla.org"
          "nixos.org"
        ];
      };
      enable_presence_by_hs_url = {
        "https://matrix.org/" = false;
        "https://matrix-client.matrix.org/" = false;
        "https://nyanbinary.rs/" = false;
        "https://matrix.nyanbinary.rs/" = false;
      };
      features = {
        feature_allow_screen_share_only_mode = true;
        feature_ask_to_join = true;
        feature_bridge_state = true;
        feature_custom_themes = true;
        feature_disable_call_per_sender_encryption = false;
        feature_dynamic_room_predecessors = true;
        feature_element_call_video_rooms = true;
        feature_exclude_insecure_devices = false;
        feature_group_calls = true;
        feature_jump_to_date = true;
        feature_latex_maths = true;
        feature_location_share_live = true;
        feature_mjolnir = true;
        feature_msc3531_hide_messages_pending_moderation = true;
        feature_new_room_list = true;
        feature_notifications = true;
        feature_notification_settings2 = true;
        feature_release_announcement = true;
        feature_render_reaction_images = true;
        feature_report_to_moderators = true;
        # feature_simplified_sliding_sync = true;
        feature_video_rooms = true;
        # feature_wysiwyg_composer = true;
      };
      setting_defaults = {
        "analyticsOptIn" = false;
        "ctrlFForSearch" = true;
        "Registration.mobileRegistrationHelper" = true;
        "UIFeature.advancedEncryption" = true;
        "UIFeature.advancedSettings" = true;
        "UIFeature.BulkUnverifiedSessionsReminder" = true;
        "UIFeature.deactivate" = true;
        "UIFeature.feedback" = false;
        "UIFeature.identityServer" = true;
        "UIFeature.locationSharing" = true;
        "UIFeature.passwordReset" = true;
        "UIFeature.registration" = true;
        "UIFeature.roomHistorySettings" = true;
        "UIFeature.shareQrCode" = true;
        "UIFeature.shareSocial" = true;
        "UIFeature.thirdPartyId" = true;
        "UIFeature.TimelineEnableRelativeDates" = true;
        "UIFeature.urlPreviews" = true;
        "UIFeature.voip" = true;
        "UIFeature.widgets" = true;
        "use_system_theme" = true;
        "useOnlyCurrentProfiles" = true;
        "userTimezonePublish" = true;
      };
      element_call = {
        url = "https://call.element.dev/";
      };
      map_style_url = "https://api.maptiler.com/maps/streets/style.json?key=fU3vlMsMn4Jb6dnEIFsx";
    };
  };
}
