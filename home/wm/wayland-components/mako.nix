{ userSettings, pkgs, config, lib, ... }: 
let
  secondaryAccentColor = config.lib.stylix.colors."base0${userSettings.secondaryAccentColor}";
in
{
  home.packages = [pkgs.libnotify];
    
  services.mako = lib.mkForce {
    enable = true;
    sort="-time";
    layer="overlay";
    backgroundColor="#${config.lib.stylix.colors.base00}D0";
    width=300;
    height=110;
    borderSize=2;
    borderColor="#${secondaryAccentColor}";
    borderRadius=5;
    padding="10";
    margin="15";
    maxIconSize=64;
    defaultTimeout=5000;
    extraConfig = ''
      [urgency=low]
      border-color=#${config.lib.stylix.colors.base0B}

      [urgency=normal]
      border-color=#${config.lib.stylix.colors.base05}

      [urgency=high]
      border-color=#${config.lib.stylix.colors.base08}

      default-timeout=0
      [category=mpd]
      default-timeout=2000

      group-by=category
    '';
  };
}
