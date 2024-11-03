{ userSettings, config, ... }:
{
  programs.waybar.style = ''
    * {
      font-family: ${userSettings.font};
      font-size: 13px;
      border-radius: 5px;
      padding: 1px 0px;
      opacity: 1;
    }

    #clock,
    #cpu,
    #custom-notification,
    #memory,
    #disk,
    #network,
    #pulseaudio,
    #tray {
      padding: 0px 10px;
      border-radius: 5px;
      background: rgba(22, 22, 22, 0.6);
      color: #${config.lib.stylix.colors.base0D};
      box-shadow: rgba(17, 17, 27, 0.2) 0px 0px 3px 2px;
      transition: all 0.3s ease;
      border: solid 2px #${config.lib.stylix.colors.base05};
      margin: 2px 5px;
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
      background: none;
    }

    #workspaces button label {
      color: #${config.lib.stylix.colors.base0D};
    }

    #workspaces button.active label {
      color: rgba(16, 16, 16, 0.6);
      font-weight: bolder;
    }

    #workspaces button:hover {
      box-shadow:  #${config.lib.stylix.colors.base0D} 0px 0px 0px 1.5px;
      min-width: 40px;
    }

    #workspaces {
      background-color: transparent;
      border-radius: 5px;
    }

    #workspaces button {
      box-shadow: rgba(17, 17, 27, 0.2) 0px 0px 3px 2px;
      padding: 0px 6px;
      background-color: rgba(16, 16, 16, 0.6);
      transition: all 0.3s ease;
      border: solid 2px #${config.lib.stylix.colors.base05};
      margin: 2px 5px;
    }

    #workspaces button.active {
      min-width: 40px;
      background-color: #${config.lib.stylix.colors.base0E};
      border: solid 2px #${config.lib.stylix.colors.base0E};
    }

    #tray menu {
      background-color: rgba(30, 30, 46, 0.6);
      opacity: 0.8;
    }

    #pulseaudio.muted {
      color: #${config.lib.stylix.colors.base0F};
      padding-right: 16px;
    }
  '';
}
