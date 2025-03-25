{ pkgs, lib, userSettings, config, inputs, ... }: 
{
  programs.swaylock = lib.mkForce {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      font = "${userSettings.font}";

      clock = true;
      timestr = "%R";
      datestr = "";
      screenshots = true;
      
      indicator = true;
      indicator-radius = 120;
      indicator-thickness = 28;
      
      effect-blur = "18x5";
      effect-vignette = "0.5:0.5";
      effect-pixelate = 5;

      text-ver="Hacking";
      
      color="1e1e2e";
      bs-hl-color="${config.lib.stylix.colors.base06}";
      key-hl-color="${config.lib.stylix.colors.base0C}";
      caps-lock-bs-hl-color="${config.lib.stylix.colors.base06}";
      caps-lock-key-hl-color="${config.lib.stylix.colors.base0C}";
      ring-color="${config.lib.stylix.colors.base0D}";
      ring-clear-color="${config.lib.stylix.colors.base06}";
      ring-caps-lock-color="${config.lib.stylix.colors.base09}";
      ring-ver-color="${config.lib.stylix.colors.base0D}";
      ring-wrong-color="${config.lib.stylix.colors.base0F}";
      text-color="${config.lib.stylix.colors.base0D}";
      text-clear-color="${config.lib.stylix.colors.base06}";
      text-caps-lock-color="${config.lib.stylix.colors.base09}";
      text-ver-color="${config.lib.stylix.colors.base0D}";
      text-wrong-color="${config.lib.stylix.colors.base0F}";
      layout-text-color="${config.lib.stylix.colors.base0D}";

      inside-color="00000000";
      inside-clear-color="00000000";
      inside-caps-lock-color="00000000";
      inside-ver-color="00000000";
      inside-wrong-color="00000000";
      layout-bg-color="00000000";
      layout-border-color="00000000";
      line-color="00000000";
      line-clear-color="00000000";
      line-caps-lock-color="00000000";
      line-ver-color="00000000";
      line-wrong-color="00000000";
      separator-color="00000000";
    };
  };
}
