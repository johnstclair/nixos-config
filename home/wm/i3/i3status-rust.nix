{ config, pkgs, ... } : let
  transparent = "#00000000";
  inherit (config.lib.stylix.colors.withHashtag)
    base00
    base01
    base02
    base03
    base04
    base05
    base06
    base07
    base08
    base09
    base0A
    base0B
    base0C
    base0D
    base0E
    base0F
    ;
in {
  programs.i3status-rust = {
    enable = true;
    bars.top = {
      blocks = [
        {
          alert = 10.0;
          block = "disk_space";
          info_type = "available";
          interval = 60;
          path = "/";
          warning = 20.0;
        }
        {
          block = "memory";
          format = " $icon $mem_used_percents ";
          format_alt = " $icon $swap_used_percents ";
        }
        {
          block = "cpu";
        }
        {
          block = "battery";
          device = "BAT0";
        }
        {
          block = "net";
          format = " $icon $signal_strength via $device ";
        }
        {
          block = "sound";
        }
        {
          block = "time";
          format = " $timestamp.datetime(f:'%a %d/%m %R') ";
        }
      ];
      settings.icon = "awesome6";
      settings.theme.overrides = {
        idle_fg = base05;
        separator_fg = base05;
        warning_fg = base05;
        critical_fg = base05;

        idle_bg = transparent;
        separator_bg = transparent;
        warning_bg = base09;
        critical_bg = base08;
      };
    };
  };
}
