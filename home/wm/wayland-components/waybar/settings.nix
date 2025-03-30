{ userSettings, systemSettings, config, ... }:
{
  home.file.".config/waybar/scripts/gpu.sh" = {
    source = ./scripts/gpu.sh;
    executable = true;
  };

  programs.waybar.settings.mainBar = {
    layer = "top";
    position = "top";
    height = 7;
    margin-top = 5;
    margin-bottom = 0;
    margin-right = 0;
    margin-left = 0;
    modules-left = [
      "hyprland/workspaces"
      "hyprland/window"
    ];
    modules-center = [
      "clock"
    ];
    modules-right = [
      "cpu"
      "custom/gpu"
      "memory"
      "disk"
      "pulseaudio"
      "network"
      "tray"
      "custom/notification"
      #"custom/power-menu"
    ];

    "hyprland/workspaces" = {
      active-only = false;
      on-click = "activate";
      disable-scroll = true;
      format = "{icon}";
      format-icons = {
        "1" = "一";
        "2" = "二";
        "3" = "三";
        "4" = "四";
        "5" = "五";
        "6" = "六";
        "7" = "七";
        "8" = "八";
        "9" = "九";
        "10" = "十";
        sort-by-number = true;
      };
    };

    "hyprland/window" = {
      format = "{}";
    };
    "tray" = {
      icon-size = 18;
      spacing = 5;
    };
    "clock" = {
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      format-alt = " {:%a %b %d}";
      format = "  {:%I:%M %p}";
      today-format = "<span color = '#${config.lib.stylix.colors.base08}'><b><u>{}</u></b></span>";
      format-calendar = "<span color='#${config.lib.stylix.colors.base06}'><b>{}</b></span>";
      format-calendar-weeks = "<span color='#${config.lib.stylix.colors.base0C}'><b>W{:%U}</b></span>";
      format-calendar-weekdays = "<span color='#${config.lib.stylix.colors.base0A}'><b>{}</b></span>";
      on-scroll = {
        calendar = 1;
      };
    };
    memory = {
      interval = 30;
      format = " {used:0.1f}G";
      on-click = "${userSettings.term} -e htop";
    };
    disk = {
      format = "󰋊 {percentage_used}%";
      format-alt = "󰋊 {used:1} / {total:1}";
      interval = 30;
      path = "/";
    };
    cpu= {
        format= "  {usage}%";
        format-alt= "  {avg_frequency} GHz";
        interval= 2;
    };
    "custom/gpu"= {
      exec= if (systemSettings.graphicsDriver == "nvidia") then "~/.config/waybar/scripts/gpu.sh" else "echo time to pr in a thing for amd lol";
      format= "󰭯 {}%";
      format-alt= "󰭯 {alt} GHz";
      tooltip= "";
      return-type= "json";
      interval= 2;
    };
    network = {
      # interface = "wlp2*"; # Optional
      format-wifi = "󰖩 {signalStrength}%";
      format-ethernet = "󰈀 {cidr}";
      tooltip-format = "{ifname} via {gwaddr}";
      format-linked = "{ifname} (No IP)";
      format-disconnect = "󰖪";
      on-click = "${userSettings.term} -e nmtui";
    };
    pulseaudio= {
        format= "{icon} {volume}%";
        format-muted= "  {volume}%";
        format-icons= {
            default= [" "];
        };
        scroll-step= 5;
        on-click= "pamixer -t";
    };
    "custom/notification" = {
        format = "{icon} ";
        format-icons = {
            notification = "<span foreground='red'><sup></sup></span> ";
            none = "  ";
            dnd-notification = "<span foreground='red'><sup></sup></span> ";
            dnd-none = "  ";
            inhibited-notification = "<span foreground='red'><sup></sup></span> ";
            inhibited-none = "  ";
            dnd-inhibited-notification = "<span foreground='red'><sup></sup></span> ";
            dnd-inhibited-none = "  ";
        };
        return-type = "json";
        exec-if = "which swaync-client";
        exec = "swaync-client -swb";
        on-click = "swaync-client -t -sw";
        on-click-right = "swaync-client -d -sw";
        escape = true;
    };
  };
}
