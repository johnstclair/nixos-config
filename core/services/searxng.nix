{ systemSettings, userSettings, pkgs, ... } : {
  services.searx = {
    enable = true;
    package = pkgs.searxng;
    redisCreateLocally = true;
    environmentFile = "/home/${userSettings.username}/.searxng.env";
    settings = {
      general = {
        instance_name = "SearXNG";
        debug = false;
        donation_url = false;
        contact_url = false;
        privacypolicy_url = false;
      };
      ui = {
        static_use_hash = true;
        default_locale = "en";
        query_in_title = true;
        infinite_scroll = false;
        center_alignment = false;
        default_theme = "simple";
        theme_args.simple_style = "auto";
        search_on_category_select = true;
        hotkeys = "vim";
      };
      server = {
        bind_address = "127.0.0.1";
        port = 9999;
        limiter = true;
        public_instance = false;
        method = "GET";
      };
      search = {
        favicon_resolver = "duckduckgo";
        safe_search = 1;
        ban_time_on_fail = 5;
        max_ban_time_on_fail = 120;
      };
      enabled_plugins = [
        "Basic Calculator"
        "Hash plugin"
        "Open Access DOI rewrite"
        "Hostnames plugin"
        "Unit converter plugin"
      ];
    };
  };
}
