{ pkgs, ... } : {
  home.packages = with pkgs; [
    discord
    slack
  ];

  home.file."~/.config/discord/settings.json".text = ''
    {
      "SKIP_HOST_UPDATE": true
      "BACKGROUND_COLOR": "#202225",
    }
  '';
}
