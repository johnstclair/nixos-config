{ config, userSettings, ... } : {
  programs.wofi = {
    enable = true;
    settings = {
      allow_images = true;
        hide_scroll = true;
        term = userSettings.term;
        show = "drun";
        width = 750;
        height = 450;
        always_parse_args = true;
        show_all = false;
        print_command = true;
        insensitive = true;
        prompt = "";
        columns = 2;
    };
    style =''
      * {
        font-family: ${userSettings.font};
        font-size: 14px;
      }

      /* Window */
      window {
        margin: 0px;
        padding: 10px;
        border: 0.16em solid #${config.lib.stylix.colors.base07};
        border-radius: 0.4em;
        background-color: #${config.lib.stylix.colors.base00};
        animation: slideIn 0.5s ease-in-out both;
      }

      /* Slide In */
      @keyframes slideIn {
        0% {
           opacity: 0;
        }

        100% {
           opacity: 1;
        }
      }

      /* Inner Box */
#inner-box {
        margin: 5px;
        padding: 10px;
        border: none;
        background-color: #${config.lib.stylix.colors.base00};
        animation: fadeIn 0.5s ease-in-out both;
      }

      /* Fade In */
      @keyframes fadeIn {
        0% {
           opacity: 0;
        }

        100% {
           opacity: 1;
        }
      }

      /* Outer Box */
#outer-box {
        margin: 5px;
        padding: 10px;
        border: none;
        background-color: #${config.lib.stylix.colors.base00};
      }

      /* Scroll */
#scroll {
        margin: 0px;
        padding: 10px;
        border: none;
        background-color: #${config.lib.stylix.colors.base00};
      }

      /* Input */
#input {
        margin: 5px 20px;
        padding: 10px;
        border: none;
        border-radius: 0.1em;
        color: #${config.lib.stylix.colors.base05};
        background-color: #${config.lib.stylix.colors.base00};
        animation: fadeIn 0.5s ease-in-out both;
      }

#input image {
          border: none;
          color: #${config.lib.stylix.colors.base08};
      }

#input * {
        outline: 4px solid #${config.lib.stylix.colors.base08}!important;
      }

      /* Text */
#text {
        margin: 5px;
        border: none;
        color: #${config.lib.stylix.colors.base05};
        animation: fadeIn 0.5s ease-in-out both;
      }

#entry {
        background-color: #${config.lib.stylix.colors.base00};
      }

#entry arrow {
        border: none;
        color: #${config.lib.stylix.colors.base07};
      }

      /* Selected Entry */
#entry:selected {
        border: 0.11em solid #${config.lib.stylix.colors.base07};
      }

#entry:selected #text {
        color: #${config.lib.stylix.colors.base0E};
      }

#entry:drop(active) {
        background-color: #${config.lib.stylix.colors.base07}!important;
      }
    '';
    };
}
