{ userSettings,  systemSettings, config, ... } : {
  imports = [
    ./theme.nix
  ];

  services.glance = {
    enable = true;
    settings = {
      server.port = 5678;
      pages = [{
        columns = [
          {
            size = "small";
            widgets = [
              {
                type = "clock";
                hour-format = "24h";
                timezones = [
                  {
                    timezone = "America/New_York";
                    label = "EST";
                  }
                  {
                    timezone = "Etc/UTC";
                    label = "UTC";
                  }
                ];
              }
              { type = "calendar"; }
              {
                type = "rss";
                title = "rss feed";
                collapse-after = 3;
                limit = 10;
                feeds = [
                  { url = "https://b-sharman.dev/blog.xml"; }
                  { url = "https://blog.babel.sh/rss"; }
                  { url = "https://blog.beeper.com/feed"; }
                  { url = "https://blog.danslimmon.com/feed"; }
                  { url = "https://chriskiehl.com/rss.xml"; }
                  { url = "https://chrismcdonough.substack.com/feed"; }
                  { url = "https://chrpaul.de/feed.xml"; }
                  { url = "https://dominickm.com/feed"; }
                  { url = "https://elijahpotter.dev/rss.xml"; }
                  { url = "https://ezrichards.github.io/index.xml"; }
                  { url = "https://go.dev/blog/feed.atom"; }
                  { url = "https://intuitiveexplanations.com/feed.xml"; }
                  { url = "https://jjtech.dev/feed.xml"; }
                  { url = "https://jsomers.net/blog/feed"; }
                  { url = "https://jvns.ca/atom.xml"; }
                  { url = "https://keenanschott.com/index.xml"; }
                  { url = "https://ludic.mataroa.blog/rss/"; }
                  { url = "https://lukaswerner.com/feed.xml"; }
                  { url = "https://lukeplant.me.uk/blog/atom/index.xml"; }
                  { url = "https://machinefossil.net/feed.xml"; }
                  { url = "https://matrix.org/blog/feed"; }
                  { url = "https://mau.fi/blog/index.rss"; }
                  { url = "https://medium.com/feed/@ericmigi"; }
                  { url = "https://neilalexander.dev/feed.xml"; }
                  { url = "https://pointlessramblings.com/index.xml"; }
                  { url = "https://skip.house/rss.xml"; }
                  { url = "https://textslashplain.com/feed/"; }
                  { url = "https://tgrcode.com/rss"; }
                  { url = "https://weekly.nixos.org/feeds/all.rss.xml"; }
                  { url = "https://www.arp242.net/feed.xml"; }
                  { url = "https://www.joelonsoftware.com/feed/"; }
                  { url = "https://www.thedroneely.com/posts/rss.xml"; }
                  { url = "https://www.wheresyoured.at/rss/"; }
                ];
              }
            ];
          }
          {
            size = "full";
            widgets = [
              {
                type = "group";
                widgets = [
                  {
                    type = "reddit";
                    subreddit = "technology";
                    show-thumbnails = true;
                  }
                ];
              }
              {
                type = "videos";
                channels = [
                  "UCXuqSBlHAE6Xw-yeJA0Tunw" # LLT
                  "UCsBjURrPoezykLs9EqgamOA" # Fireship
                  "UCBJycsmduvYEL83R_U4JriQ" # MKBHD
                  "UCHnyfMqiRRG1u-2MsSQLbXA" # Veritasium
                  "UCUMwY9iS8oMyWDYIe6_RmoA" # No Boilerplate
                ];
              }
              {
                type = "group";
                widgets = [
                  {
                    type = "hacker-news";
                  }
                  {
                    type = "lobsters";
                  }
                ];
              }
            ];
          }
          {
            size = "small";
            widgets = [
              {
                type = "markets";
                markets = [
                  {
                    symbol = "SPY";
                    name = "S&P 500";
                  }
                  {
                    symbol = "BTC-USD";
                    name = "Bitcoin";
                  }
                  {
                    symbol = "NVDA";
                    name = "NVIDIA";
                  }
                  {
                    symbol = "AAPL";
                    name = "Apple";
                  }
                  {
                    symbol = "TSLA";
                    name = "Tesla";
                  }
                ];
              }
              {
                type = "releases";
                cache = "1d";
                repositories = [
                  "glanceapp/glance"
                  "neovim/neovim"
                  "NixOS/nixpkgs"
                  "rust-lang/rust"
                  "tauri-apps/tauri"
                ];
              }
            ];
          }
        ];
        name = "Home";
        hide-desktop-navigation = true;
      }];
    };
  };
}

