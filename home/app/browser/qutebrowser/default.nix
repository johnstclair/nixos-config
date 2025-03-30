{ pkgs, ... } :  {
  programs.qutebrowser = {
    enable = true;

    searchEngines = {
      "DEFAULT" = "http://127.0.0.1:9999/search?q={}";
      "g" = "https://google.com/search?q={}";
      "d" = "https://duckduckgo.com/?t=ffab&q={}";
      "yt" = "https://youtube.com/results?search_query={}";
      "gh" = "https://github.com/search?q={}&type=repositories";
      "r" = "https://www.reddit.com/search?q={}";
      "n" = "https://mynixos.com/search?q={}";
      "nixo" = "https://search.nixos.org/options?channel=unstable&query={}";
      "nixp" = "https://search.nixos.org/packages?channel=unstable&query={}";
    };

    quickmarks = {
      mynixos = "https://mynixos.com";
      github = "https://github.com";
      nixvim = "https://nix-community.github.io/nixvim/";
      hyprland = "https://wiki.hyprland.org/";
      nerdfont = "https://www.nerdfonts.com/cheat-sheet";
      youtube = "https://youtube.com/";
    };

    settings = {
      colors = {
        webpage.preferred_color_scheme =
          "dark"; 
      };

      hints = {
        radius = 1;
        chars = "arstdhneio";
      };

      scrolling.smooth = true;

      zoom.default = "100%";

      qt.force_software_rendering = "chromium";
    };

    keyBindings = {
      normal = {
        " p" = "tab-move -";
        " n" = "tab-move +";
        " w" = "tab-close";
        "<tab>" = "tab-next";
        "<Shift-tab>" = "tab-prev";

        "<Shift-Left>" = "back";
        "<Shift-Right>" = "forward";

        " 1" = "tab-focus 1";
        " 2" = "tab-focus 2";
        " 3" = "tab-focus 3";
        " 4" = "tab-focus 4";
        " 5" = "tab-focus 5";
        " 6" = "tab-focus 6";
        " 7" = "tab-focus 7";
        " 8" = "tab-focus 8";
        " 9" = "tab-focus 9";
        " 0" = "tab-focus 10";

        "<Ctrl-w>" = "tab-close";
        "<Ctrl-n>" = "open -w";

        "<Ctrl-1>" = "tab-focus 1";
        "<Ctrl-2>" = "tab-focus 2";
        "<Ctrl-3>" = "tab-focus 3";
        "<Ctrl-4>" = "tab-focus 4";
        "<Ctrl-5>" = "tab-focus 5";
        "<Ctrl-6>" = "tab-focus 6";
        "<Ctrl-7>" = "tab-focus 7";
        "<Ctrl-8>" = "tab-focus 8";
        "<Ctrl-9>" = "tab-focus 9";
        "<Ctrl-0>" = "tab-focus 10";
      };

      command = {
        "<Ctrl-w>" = "tab-close";
        "<Ctrl-n>" = "open -w";
        "<Ctrl-1>" = "tab-focus 1";
        "<Ctrl-2>" = "tab-focus 2";
        "<Ctrl-3>" = "tab-focus 3";
        "<Ctrl-4>" = "tab-focus 4";
        "<Ctrl-5>" = "tab-focus 5";
        "<Ctrl-6>" = "tab-focus 6";
        "<Ctrl-7>" = "tab-focus 7";
        "<Ctrl-8>" = "tab-focus 8";
        "<Ctrl-9>" = "tab-focus 9";
        "<Ctrl-0>" = "tab-focus 10";
      };

      insert = {
        "<Ctrl-w>" = "tab-close";
        "<Ctrl-n>" = "open -w";
      };
    };

    extraConfig = ''
      c.tabs.padding = {"bottom": 6, "left": 7, "right": 7, "top": 6}
      c.statusbar.padding = {"bottom": 6, "left": 7, "right": 7, "top": 6}
      c.url.start_pages = ['http://127.0.0.1:9999']

      config.load_autoconfig(True)
    '';
  };
}
