{ systemSettings, inputs, ... } : {
  imports = [
    ./tridactyl.nix
  ];
  programs.firefox = {
    enable = true;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value= true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DisableFirefoxScreenshots = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "never";
      DisplayMenuBar = "default-off";
      SearchBar = "unified";
      SearchEngines = {
        PreventInstalls = true;
        Add = [
          {
            Name = "SearXNG";
            URLTemplate = "http://127.0.0.1:9999/?q={searchTerms}";
            Method = "GET"; 
            Description = "SearXNG running on localhost";
          }
        ];
        Remove = [
          "Amazon.com"
          "Bing"
          "Google"
        ];
        Default = "SearXNG";
      };
      preferences = {
        "accessibility.typeaheadfind.manual" = false;
      };
    };

    profiles.default = {
      extensions.packages = with inputs.firefox-addons.packages.${systemSettings.system}; [
        ublock-origin
        tabliss
        privacy-badger
        search-by-image
        darkreader
      ];
      bookmarks = {
        force = true;
        settings = [
          {
            name = "glance";
            tags = [ "feed" ];
            keyword = "glance";
            url = "0.0.0.0:5678";
          }
        ];
      };
    };
  };
}
