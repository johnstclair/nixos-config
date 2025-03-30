{config, lib, pkgs, inputs, userSettings, ...}:

let
  themeBasePath = "../../themes";
  themePolarity = lib.removeSuffix "\n" (builtins.readFile (./. + ("/" + themeBasePath +"/"+userSettings.theme)+"/polarity.txt"));
  themeNamePath = "${themeBasePath}/${userSettings.theme}/style.yaml";
  backgroundPath = "${themeBasePath}/${userSettings.theme}/background${userSettings.background}";
in
{
  imports = [ inputs.stylix.homeManagerModules.stylix ];

  stylix.enable = true;
  stylix.autoEnable = true;

  # disabled targets
  stylix.targets.waybar.enable = false;
  stylix.targets.glance.enable = false;

  # modify targets
  stylix.targets.vscode.profileNames = [ "default" ];
  stylix.targets.firefox.profileNames = [ "default" ];

  stylix.base16Scheme = (./${themeNamePath});
  stylix.polarity = themePolarity;
  stylix.image = (./${backgroundPath});

  stylix.fonts.sizes = {
    applications = 12;
    terminal = 12;
    desktop = 10;
    popups = 10;
  };

  stylix.opacity = {
    applications = .95;
    terminal = .85;
    desktop = 1.0;
    popups = .95;
  };
}
