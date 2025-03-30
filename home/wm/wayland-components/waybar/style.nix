{ userSettings, config, ... }:
let
  primaryAccentColor = config.lib.stylix.colors."base0${userSettings.primaryAccentColor}";
  secondaryAccentColor = config.lib.stylix.colors."base0${userSettings.secondaryAccentColor}";
in
{
  programs.waybar.style = ''
    * {
      font-family: ${userSettings.font};
      font-size: 13px;
      border-radius: 5px;
      padding: 1px 0px;
      opacity: 1;
    }

    tooltip,
    #clock,
    #cpu,
    #custom-gpu,
    #custom-notification,
    #memory,
    #disk,
    #network,
    #pulseaudio,
    #tray {
      padding: 0px 10px;
      border-radius: 5px;
      background: transparent;
      font-family: ${userSettings.font};
      color: #${config.lib.stylix.colors.base05};
      box-shadow: rgba(17, 17, 27, 0.2) 0px 0px 3px 2px;
      transition: all 0.3s ease;
      border: solid 2px #${config.lib.stylix.colors.base05};
      margin: 2px 5px;
    } 

    tooltip {
      background: alpha(#${config.lib.stylix.colors.base00}, .7);
      border: solid 2px #${secondaryAccentColor};
    }
    
    #clock:hover,
    #cpu:hover,
    #custom-gpu:hover,
    #custom-notification:hover,
    #memory:hover,
    #disk:hover,
    #network:hover,
    #pulseaudio:hover,
    #tray:hover {
      border: solid 2px #${secondaryAccentColor}
    } 

    #custom-notification {
      padding-right: 7px;
    }

    window#waybar {
      border-radius: 0px;
      /* background: repeating-linear-gradient(
        to right,
        #${config.lib.stylix.colors.base08} 0%,
        #${config.lib.stylix.colors.base08} 5%,
        #${config.lib.stylix.colors.base09} 5%,
        #${config.lib.stylix.colors.base09} 10%,
        #${config.lib.stylix.colors.base0A} 10%,
        #${config.lib.stylix.colors.base0A} 15%,
        #${config.lib.stylix.colors.base0B} 15%,
        #${config.lib.stylix.colors.base0B} 20%,
        #${config.lib.stylix.colors.base0D} 20%,
        #${config.lib.stylix.colors.base0D} 25%,
        #${config.lib.stylix.colors.base0E} 25%,
        #${config.lib.stylix.colors.base0E} 30%
      ); */
      background: alpha(#${config.lib.stylix.colors.base00}, .9);
    }

    #workspaces button label {
      color: #${config.lib.stylix.colors.base05};
    }

    #workspaces button.active label {
      color: rgba(16, 16, 16, 0.6);
      font-weight: bolder;
    }

    #workspaces button:hover {
      border: solid 2px #${secondaryAccentColor};
      min-width: 40px;
    }

    #workspaces {
      background-color: transparent;
      border-radius: 5px;
    }

    #workspaces button {
      box-shadow: rgba(17, 17, 27, 0.2) 0px 0px 3px 2px;
      padding: 0px 6px;
      background-color: transparent;
      transition: all 0.3s ease;
      border: solid 2px #${config.lib.stylix.colors.base05};
      margin: 2px 5px;
    }

    #workspaces button.active {
      min-width: 40px;
      background-color: #${primaryAccentColor};
      border: solid 2px #${primaryAccentColor};
    }

    #workspaces button.active:hover {
      min-width: 60px;
    }

    #tray menu {
      background-color: transparent;
      opacity: 0.8;
    }

    #pulseaudio.muted {
      color: #${config.lib.stylix.colors.base0F};
      padding-right: 16px;
    }
  '';
}
