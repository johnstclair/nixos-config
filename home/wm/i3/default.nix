{ config, pkgs, lib, userSettings, ... } : {
  imports = [
    ./config.nix
  ];

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
  };

  home.packages = with pkgs; [
    pulseaudio # pulseaudio
    pulsemixer # pulseaudio mixer
    playerctl
  ];
}
