{ config, pkgs, lib, userSettings, ... } : {
  imports = [
    ./config.nix
  ];

  home.packages = with pkgs; [ 
    dmenu
    i3-gaps
    i3blocks
    i3lock
  ];

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
  };
}
