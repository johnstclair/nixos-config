{ config, userSettings, pkgs, ... }:
{
  home.packages = (with pkgs; [ swaynotificationcenter ]);
  home.file.".config/swaync/config.json".text = ''
    {
      "positionX": "right",
      "positionY": "top",
      "layer": "overlay",
      "layer-shell": "true",
      "cssPriority": "application",
      "control-center-margin-top": 10,
      "control-center-margin-bottom": 10,
      "control-center-margin-right": 10,
      "control-center-margin-left": 10,
      "notification-icon-size": 64,
      "notification-body-image-height": 128,
      "notification-body-image-width": 200,
      "timeout": 10,
      "timeout-low": 5,
      "timeout-critical": 0,
      "fit-to-screen": true,
      "control-center-width": 400,
      "control-center-height": 650,
      "notification-window-width": 350,
      "keyboard-shortcuts": true,
      "image-visibility": "when-available",
      "transition-time": 200,
      "hide-on-clear": false,
      "hide-on-action": true,
      "script-fail-notify": true,
      "widgets": [
        "title",
        "menubar#desktop",
        "volume",
        "backlight#mobile",
        "mpris",
        "dnd",
        "notifications"
      ],
      "widget-config": {
        "title": {
          "text": "Notifications",
          "clear-all-button": true,
          "button-text": " Clear All "
        },
        "menubar#desktop": {
          "menu#powermode-buttons": {
            "label": " 󰌪 ",
            "position": "left",
            "actions": [
              {
                "label": "Performance",
                "command": "powerprofilesctl set performance"
              },
              {
                "label": "Balanced",
                "command": "powerprofilesctl set balanced"
              },
              {
                "label": "Power-saver",
                "command": "powerprofilesctl set power-saver"
              }
            ]
          },
          "menu#screenshot": {
            "label": "  ",
            "position": "left",
            "actions": [
              {
                "label": "󰹑  Whole screen",
                "command": "grimblast --notify --cursor --freeze copy output"
              },
              {
                "label": "󰩭  Window / Region",
                "command": "grimblast --notify --cursor --freeze copy area"
              }
            ]
          },
          "menu#record": {
            "label": " 󰕧 ",
            "position": "left",
            "actions": [
              {
                "label": "  Record screen",
                "command": "record screen & ; swaync-client -t"
              },
              {
                "label": "  Record selection",
                "command": "record area & ; swaync-client -t"
              },
              {
                "label": "  Record GIF",
                "command": "record gif & ; swaync-client -t"
              },
              {
                "label": "󰻃  Stop",
                "command": "record stop"
              }
            ]
          },
          "menu#power-buttons": {
            "label": "  ",
            "position": "left",
            "actions": [
              {
                "label": "  Lock",
                "command": "swaylock"
              },
              {
                "label": "󰤄  Sleep",
                "command": "${userSettings.term} --command systemctl suspend & ${userSettings.term} --command swaylock"
              },
              {
                "label": "  Reboot",
                "command": "systemctl reboot"
              },
              {
                "label": "  Shut down",
                "command": "systemctl poweroff"
              }
            ]
          }
        },
        "backlight#mobile": {
          "label": " 󰃠 ",
          "device": "panel"
        },
        "volume": {
          "label": "",
          "expand-button-label": "",
          "collapse-button-label": "",
          "show-per-app": true,
          "show-per-app-icon": true,
          "show-per-app-label": false
        },
        "dnd": {
          "text": " Do Not Disturb"
        },
        "mpris": {
          "image-size": 85,
          "image-radius": 5
        }
      }
    }
  '';

  home.file.".config/swaync/style.css".text = ''
    @define-color shadow rgba(0, 0, 0, 0.25);

    @define-color base   #${config.lib.stylix.colors.base00};
    @define-color mantle #${config.lib.stylix.colors.base01};
    @define-color crust  #${config.lib.stylix.colors.base00};

    @define-color text     #${config.lib.stylix.colors.base05};
    @define-color subtext0 #${config.lib.stylix.colors.base05};
    @define-color subtext1 #${config.lib.stylix.colors.base05};

    @define-color surface0 #${config.lib.stylix.colors.base00};
    @define-color surface1 #${config.lib.stylix.colors.base01};
    @define-color surface2 #${config.lib.stylix.colors.base02};

    @define-color overlay0 #${config.lib.stylix.colors.base02};
    @define-color overlay1 #${config.lib.stylix.colors.base03};
    @define-color overlay2 #${config.lib.stylix.colors.base04};

    @define-color blue      #${config.lib.stylix.colors.base0D};
    @define-color lavender  #${config.lib.stylix.colors.base05};
    @define-color sapphire  #${config.lib.stylix.colors.base0D};
    @define-color sky       #${config.lib.stylix.colors.base0C};
    @define-color teal      #${config.lib.stylix.colors.base0C};
    @define-color green     #${config.lib.stylix.colors.base0B};
    @define-color yellow    #${config.lib.stylix.colors.base0A};
    @define-color peach     #${config.lib.stylix.colors.base09};
    @define-color maroon    #${config.lib.stylix.colors.base08};
    @define-color red       #${config.lib.stylix.colors.base08};
    @define-color mauve     #${config.lib.stylix.colors.base0E};
    @define-color pink      #${config.lib.stylix.colors.base0E};
    @define-color flamingo  #${config.lib.stylix.colors.base0F};
    @define-color rosewater #${config.lib.stylix.colors.base06};
 
 * {
        font-family: ${userSettings.font};
        background-clip: border-box;
    }

    label {
      color: @text;
    }

    .notification {
        border: solid 2px @lavender;
        box-shadow: none;
        border-radius: 5px;
        background: @base;
    }

    .notification button {
        background: transparent;
        border-radius: 0px;
        border: none;
        margin: 0px;
        padding: 0px;
    }

    .notification button:hover {
        background: @crust;
    }


    .notification-content {
        min-height: 64px;
        margin: 10px;
        padding: 0px;
        border-radius: 0px;
        background: transparent;
        border: none;
    }

    .close-button {
        background: @crust;
        color: @surface2;
    }

    .notification-default-action,
    .notification-action {
        background: transparent;
        border: none;
    }


    .notification-default-action {
        border-radius: 5px;
    }

    /* When alternative actions are visible */
    .notification-default-action:not(:only-child) {
        border-bottom-left-radius: 0px;
        border-bottom-right-radius: 0px;
    }

    .notification-action {
        border-radius: 0px;
        padding: 2px;
        color: @text;
        /* color: @theme_text_color; */
    }

    /* add bottom border radius to eliminate clipping */
    .notification-action:first-child {
        border-bottom-left-radius: 4px;
    }

    .notification-action:last-child {
        border-bottom-right-radius: 4px;
    }

    /*** Notification ***/
    /* Notification header */
    .summary {
        color: @text;
        /* color: @theme_text_color; */
        font-size: 16px;
        padding: 0px;
    }

    .time {
        color: @subtext0;
        /* color: alpha(@theme_text_color, 0.9); */
        font-size: 12px;
        text-shadow: none;
        margin: 0px 0px 0px 0px;
        padding: 2px 0px;
    }

    .body {
        font-size: 14px;
        font-weight: 500;
        color: @subtext1;
        /* color: alpha(@text, 0.9); */
        /* color: alpha(@theme_text_color, 0.9); */
        text-shadow: none;
        margin: 0px 0px 0px 0px;
    }

    .body-image {
        border-radius: 5px;
    }

    /* The "Notifications" and "Do Not Disturb" text widget */
    .top-action-title {
        color: @text;
        text-shadow: none;
        border: 2px solid @lavender;
    }

    /* Control center */

    .control-center {
        border-radius: 5px;
        border: solid 2px @lavender;
    }

    .control-center-list {
        /* background: @base; */
        min-height: 5px;
        border-top: none;
        border-radius: 0px 0px 5px 5px;
    }

    .control-center-list-placeholder,
    .notification-group-icon,
    .notification-group {
     color: alpha(@theme_text_color, 0.50);
    }

    .notification-group {
        all: unset;
        border: none;
        opacity: 0;
        padding: 0px;
        box-shadow: none;
        /* selectable: no; */
    }
    .notification-group > box {
        all: unset;
        background: @mantle;
        border: solid 2px @lavender;
        padding: 8px;
        margin: 0px;
        /* margin: 0px -5px; */
        border-radius: 5px;
        box-shadow: none;
    }


    .notification-row {
        outline: none;
        transition: all 1s ease;
        background: transparent;
        margin: 10px 5px 0px 5px;
        border-radius: 5px;
    }

    .notification-row:focus,
    .notification-row:hover {
        box-shadow: none;
    }

    .control-center-list > row,
    .control-center-list > row:focus,
    .control-center-list > row:hover {
        background: transparent;
        border: none;
        margin: 0px;
        padding: 5px 10px 5px 10px;
        box-shadow: none;
    }

    .control-center-list > row:last-child {
        padding: 5px 10px 10px 10px;
    }


    /* Window behind control center and on all other monitors */
    .blank-window {
        background: transparent;
    }

    /*** Widgets ***/

    /* Title widget */
    .widget-title {
        margin: 0px;
        background: inherit;
        /* background: @theme_bg_color; */
        border-radius: 5px 5px 0px;
        border-bottom: none;
        padding-bottom: 20px;
    }

    .widget-title > label {
        margin: 18px 10px;
        font-size: 20px;
        font-weight: 500;
    }

    .widget-title > button {
        font-weight: 700;
        padding: 7px 3px;
        margin-right: 10px; 
        background: @mantle;
        color: @text;
        /* color: @theme_text_color; */
        border-radius: 5px;
        border: 2px solid @lavender;

    }
    .widget-title > button:hover {
        background: @base;
        /* background: alpha(currentColor, 0.1); */
    }

    /* Label widget */
    .widget-label {
        margin: 0px;
        padding: 0px;
        min-height: 5px;
        background: @mantle;
        /* background: @theme_bg_color; */
        border-radius: 0px 0px 5px 5px;
        border-top: none;
    }
    .widget-label > label {
        font-size: 0px;
        font-weight: 400;
    }

    /* Menubar */
    .widget-menubar {
        background: inherit;
        /* background: @theme_bg_color; */
        border-top: none;
        border-bottom: none;
    }
    .widget-menubar > box > box {
        margin: 5px 10px 5px 10px;
        min-height: 40px;
        border-radius: 5px;
        background: transparent;
    }
    .widget-menubar > box > box > button {
        background: @mantle;
        /* background: alpha(currentColor, 0.05); */
        min-width: 85px;
        min-height: 50px;
        margin-right: 13px;
        font-size: 17px;
        padding: 0px;
        border: 2px solid @lavender;
    }
    .widget-menubar > box > box > button:nth-child(4) {
        margin-right: 0px;
    }
    .widget-menubar button:focus {
        box-shadow: none;
    }
    .widget-menubar button:hover {
        background: @base;
        /* background: alpha(currentColor,0.1); */
        box-shadow: none;
    }

    .widget-menubar > box > revealer > box {
        margin: 5px 10px 5px 10px;
        background: @mantle;
        /* background: alpha(currentColor, 0.05); */
        border-radius: 5px;
        border: 2px solid @lavender;
    }
    .widget-menubar > box > revealer > box > button {
        background: transparent;
        min-height: 50px;
        padding: 0px;
        margin: 5px;
    }

    /* Buttons grid */
    .widget-buttons-grid {
        /* background-color: @theme_bg_color; */
        background-color: @mantle;
        border-top: none;
        border-bottom: none;
        font-size: 14px;
        font-weight: 500;
        margin: 0px;
        padding: 5px;
        border-radius: 5px;
    }

    .widget-buttons-grid > flowbox > flowboxchild {
        background: @mantle;
        /* background: alpha(currentColor, 0.05); */
        border-radius: 5px;
        min-height: 50px;
        min-width: 85px;
        margin: 5px;
        padding: 0px;
    }

    .widget-buttons-grid > flowbox > flowboxchild > button {
        background: transparent;
        border-radius: 5px;
        margin: 0px;
        border: none;
        box-shadow: none;
    }


    .widget-buttons-grid > flowbox > flowboxchild > button:hover {
        background: @mantle;
        /* background: alpha(currentColor, 0.1); */
    }

    /* Mpris widget */
    .widget-mpris {
        padding: 10px;
        padding-bottom: 35px;
        padding-top: 35px;
        margin-bottom: -33px;
    }
    .widget-mpris > box {
        padding: 0px;
        border: 2px solid @lavender;
        margin: -5px 0px -10px 0px;
        padding: 0px;
        border-radius: 5px;
        /* background: alpha(currentColor, 0.05); */
        background: @mantle;
    }
    .widget-mpris > box > button:nth-child(1),
    .widget-mpris > box > button:nth-child(3) {
        margin-bottom: 0px;
    }
    .widget-mpris > box > button:nth-child(1) {
        margin-left: -25px;
        margin-right: -25px;
        opacity: 0;
    }
    .widget-mpris > box > button:nth-child(3) {
        margin-left: -25px;
        margin-right: -25px;
        opacity: 0;
    }

    .widget-mpris-album-art {
      all: unset;
      border: 2px solid @lavender;
      border-radius: 7px;
    }

    /* Player button box */
    .widget-mpris > box > carousel > widget > box > box:nth-child(2) {
        margin: 5px 0px -5px 90px;
        border-top: 2px solid @lavender;
    }

    /* Player buttons */
    .widget-mpris > box > carousel > widget > box > box:nth-child(2) > button {
        border-radius: 5px;
    }
    .widget-mpris > box > carousel > widget > box > box:nth-child(2) > button:hover {
        background: alpha(currentColor, 0.1);
    }
    carouselindicatordots {
      opacity: 0;
    }

    .widget-mpris-title {
        color: #eeeeee;
        font-weight: bold;
        font-size: 1.25rem;
        text-shadow: 0px 0px 5px rgba(0, 0, 0, 0.5);
    }
    .widget-mpris-subtitle {
        color: #eeeeee;
        font-size: 1rem;
        text-shadow: 0px 0px 3px rgba(0, 0, 0, 1);
    }

    .widget-mpris-player {
      border-radius: 5px;
      margin: 0px;
    }
    .widget-mpris-player > box > image {
        margin: 0px 0px -48px 0px;
    }

    .notification-group > box.vertical {
      margin-top: 3px
    }

    /* Backlight and volume widgets */
    .widget-backlight,
    .widget-volume {
        border-top: none;
        background: transparent;
        border-bottom: none; font-size: 13px;
        font-weight: 600;
        border-radius: 5px;
        margin: 0px;
        padding: 0px;
    }
    .widget-volume > box {
        background: @mantle;
        border: 2px solid @lavender;
        /* background: alpha(currentColor, 0.05); */
        border-radius: 5px;
        margin: 5px 10px 5px 10px;
        min-height: 50px;
    }
    .widget-volume > box > label {
        min-width: 50px;
        padding: 0px;
    }
    .widget-volume > box > button {
        min-width: 50px;
        box-shadow: none;
        padding: 0px;
    }
    .widget-volume > box > button:hover {
        /* background: alpha(currentColor, 0.05); */
        background: @surface0;
    }
    .widget-volume > revealer > list {
        background: @mantle;
        /* background: alpha(currentColor, 0.05); */
        border-radius: 5px;
        margin-top: 5px;
        padding: 0px;
        border: 2px solid @lavender;
    }
    .widget-volume > revealer > list > row {
        padding-left: 10px;
        min-height: 40px;
        background: transparent;
    }
    .widget-volume > revealer > list > row:hover {
        background: transparent;
        box-shadow: none;
        border-radius: 5px;
    }
    .widget-backlight > scale {
        background: @mantle;
        /* background: alpha(currentColor, 0.05); */
        border-radius: 0px 5px 5px 0px;
        margin: 5px 10px 5px 0px;
        padding: 0px 10px 0px 0px;
        min-height: 50px;
    }
    .widget-backlight > label {
        background: @surface0;
        /* background: alpha(currentColor, 0.05); */
        margin: 5px 0px 5px 10px;
        border-radius: 5px 0px 0px 4px;
        padding: 0px;
        min-height: 50px;
        min-width: 50px;
    }

    /* DND widget */
    .widget-dnd {
      margin: 8px;
      font-size: 1.1rem;
      padding-top: 20px;
    }

    .widget-dnd>switch {
      font-size: initial;
      border-radius: 5px;
      background: @surface0;
      border: 2px solid @lavender;
      box-shadow: none;
    }

    .widget-dnd>switch:checked {
      background: @surface2;
    }

    .widget-dnd>switch slider {
      background: @lavender;
      border-radius: 5px;
    }

    /* Toggles */
    .toggle:checked {
        background: @surface1;
        /* background: @theme_selected_bg_color; */
    }
    .toggle:checked:hover {
        background: @surface2;
        /* background: alpha(@theme_selected_bg_color, 0.75); */
    }

    /* Sliders */
    scale {
        padding: 0px;
        margin: 0px 10px 0px 10px;
    }

    scale trough {
        border-radius: 5px;
        background: @surface0;
        /* background: alpha(currentColor, 0.1); */
    }

    scale highlight {
        border-radius: 5px;
        min-height: 10px;
        margin-right: -5px;
    }

    scale slider {
        margin: -10px;
        min-width: 10px;
        min-height: 10px;
        background: transparent;
        box-shadow: none;
        padding: 0px;
    }
    scale slider:hover {
    }

    .right.overlay-indicator {
      all: unset;
    }
  '';
}
