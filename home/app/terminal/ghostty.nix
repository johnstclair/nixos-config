{inputs, pkgs, userSettings, systemSettings, config, ...} :
let
  ghostty = inputs.ghostty.packages.${systemSettings.system}.default;
in 
{
  home.packages = with pkgs; [ ghostty kitty ];


  xdg.configFile."ghostty/config".text = ''
    # Font
    font-size = 11
    font-family = ${userSettings.font}

    adjust-box-thickness = 1

    # Theme
    theme = "stylix"

    cursor-style = bar
    cursor-style-blink = false
    adjust-cursor-thickness = 1

    confirm-close-surface = false

    mouse-hide-while-typing = true

    window-decoration = false
    window-padding-x = 5
    window-padding-y = 5
    window-padding-balance = true
    window-padding-color = background
    window-inherit-working-directory = true
    window-inherit-font-size = true
    window-decoration = false

    auto-update = off
  '';
  xdg.configFile."ghostty/themes/stylix".text = ''
    background = ${config.lib.stylix.colors.base00}
    foreground = ${config.lib.stylix.colors.base07}

    palette = 0=${config.lib.stylix.colors.base00}
    palette = 1=${config.lib.stylix.colors.base08}
    palette = 2=${config.lib.stylix.colors.base0B}
    palette = 3=${config.lib.stylix.colors.base09}
    palette = 4=${config.lib.stylix.colors.base0D}
    palette = 5=${config.lib.stylix.colors.base0E}
    palette = 6=${config.lib.stylix.colors.base0B}
    palette = 7=${config.lib.stylix.colors.base04}
    palette = 8=${config.lib.stylix.colors.base03}
    palette = 9=${config.lib.stylix.colors.base08}
    palette = 10=${config.lib.stylix.colors.base0B}
    palette = 11=${config.lib.stylix.colors.base0A}
    palette = 12=${config.lib.stylix.colors.base0D}
    palette = 13=${config.lib.stylix.colors.base0E}
    palette = 14=${config.lib.stylix.colors.base0C}
    palette = 15=${config.lib.stylix.colors.base07}

    cursor-color = ${config.lib.stylix.colors.base05}

    selection-foreground = #282828
    selection-background = ${config.lib.stylix.colors.base0B}
  '';
}
