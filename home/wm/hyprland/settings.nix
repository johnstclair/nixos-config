{ lib, userSettings, config, ... }: 
let
  primaryAccentColor = config.lib.stylix.colors."base0${userSettings.primaryAccentColor}";
in
{
  wayland.windowManager.hyprland= lib.mkForce {
    settings = {
      exec-once = [
        # "hyprctl dispatch exec '[workspace 1 silent] ${userSettings.term} -e nmtui-connect'"
        # "systemctl --user restart hyprpaper.service"
        "pomodoro 25 5 &"
        "kdeconnectd&"
        "sleep 2s && kdeconnect-indicator&"
        "waybar"
        "swaync"
      ];

      windowrule = [
        "tag +launcher, class:^(launcher.launcher.launcher)$"
        "float, tag:launcher*"
        "stayfocused, tag:launcher*"
        "size 600 400, tag:launcher*"

        "tag +tridactyl, class:^(tridactyl.tridactyl.tridactyl)$"
        "float, tag:tridactyl*"
        "size 800 1000, tag:tridactyl*"
      ];

      input = {
        kb_layout = "us";
        sensitivity = userSettings.sensitivity;
        repeat_delay = 180;
        repeat_rate = 30;
      };

      debug = {
        disable_logs = false;
      };

      general = {
        "$mainMod" = "ALT";
        "$notMainMod" = "SUPER";
        gaps_in = 5;
        gaps_out = 5;
        border_size = 2;
        "col.active_border" = "rgb(${primaryAccentColor})";
        "col.inactive_border" = "0xFF${config.lib.stylix.colors.base05}";
        layout = "dwindle";
      };

      misc = {
        disable_hyprland_logo = true;
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master = {
        new_status = "master";
      };

      decoration = {
        rounding = 3;
        "$opacity" = .90;
        active_opacity = "$opacity";
        inactive_opacity = "$opacity";
        fullscreen_opacity = 1.0;

        blur = {
          enabled = true;
          size = 4;
          passes = 3;
          brightness = 1;
          contrast = 1.400;
          ignore_opacity = true;
          new_optimizations = true;
          xray = true;
        };
      };

      animations = {
        enabled = true;

        bezier = [
          "wind, 0, 0, .1, 1.05"
          "winIn, 0.1, .15, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
        ];

        animation = [
          "windows, 1, 4 , wind, slide"
          "windowsIn, 1, 4, winIn, slide"
          "windowsOut, 1, 4, winOut, slide"
          "windowsMove, 1, 4, wind, slide"
          "border, 1, 1, liner"
          "borderangle, 1, 30, liner, once"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind"
          "specialWorkspace, 1, 5, wind, slidevert"
        ];
      };
    };

    extraConfig = "
      ${userSettings.monitorSettings}
    ";
  };
}
