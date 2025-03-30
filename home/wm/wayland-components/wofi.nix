{ config, userSettings, lib, ... } : 
let
  primaryAccentColor = config.lib.stylix.colors."base0${userSettings.primaryAccentColor}";
  secondaryAccentColor = config.lib.stylix.colors."base0${userSettings.secondaryAccentColor}";
in 
{
  programs.wofi = {
    enable = true;
    settings = {
      allow_images = false;
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
      columns = 1;
    };
    style = lib.mkForce ''
      * {
        font-family: ${userSettings.font};
        font-size: 14px;
      }

      @define-color base           #${config.lib.stylix.colors.base00};
      @define-color primary        #${primaryAccentColor};
      @define-color secondary      #${secondaryAccentColor} ;
      @define-color base_alt       #${config.lib.stylix.colors.base01};
       
      window {
          border: 2px solid @secondary;
          border-radius: 5px;
          opacity: .9;
      }
       
#input {
          margin-bottom: 15px;
          padding:5px;
          border: none;
          color: @primary;
      }
       
#outer-box {
          margin: 5px;
          padding: 10px;
          background-color: @base;
          /* border-radius: 15px; */
      }
       
#text {
          padding: 5px;
          color: @primary;
      }
       
#entry {
          padding: 10px;
      }
       
#entry:nth-child(even) {
          background-color: @base;
      }
       
#entry:selected {
          background-color: @base_alt;
      }
    '';
    };
}
