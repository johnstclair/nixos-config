{ pkgs, ... } : {
  home.packages = with pkgs; [
    fzf
    gawk
  ];

  xdg.configFile."sway-launcher-desktop/launch.sh" = {
    source = ./launch.sh;
    executable = true;
  };
}
