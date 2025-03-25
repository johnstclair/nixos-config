{ pkgs, lib, config, userSettings, ... } :
with config.lib.stylix.colors.withHashtag; {
  xdg.configFile."./ags-colors/_colors.scss".text = ''
    $red: ${base08};
    $orange: ${base09};
    $yellow: ${base0A};
    $green: ${base0B};
    $cyan: ${base0C};
    $blue: ${base0D};
    $magenta: ${base0E};
    $brown: ${base0F};
    $bright-red: ${base12};
    $bright-orange: ${base13};
    $bright-green: ${base14};
    $bright-cyan: ${base15};
    $bright-blue: ${base16};
    $bright-magenta: ${base17};

    $bg: ${base00};
    $bg-alt: ${base01};
    $fg: ${base05};
    $fg-alt: ${base04};

    $primary-accent: #${config.lib.stylix.colors."base0${userSettings.primaryAccentColor}"};
    $secondary-accent: #${config.lib.stylix.colors."base0${userSettings.secondaryAccentColor}"};
  '';
}
