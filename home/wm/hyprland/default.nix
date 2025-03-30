{ inputs, pkgs, ... }: 
{
  imports = [
    ./variables.nix
    ./settings.nix
    ./binds.nix

    ./hypridle.nix # idle and sleep
    #../wayland-components/wofi.nix # wofi app launcher
    ../../tui/sway-launcher-desktop/default.nix # tui app launcher
    ../wayland-components/waybar/default.nix # waybar
    ../wayland-components/swaync/default.nix # notification center
    #../wayland-components/ags/default.nix # sidebar
    ../wayland-components/swaylock/default.nix # lock screen
    ../wayland-components/mako.nix # notifications
  ];

  home.packages = with pkgs; [
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast
    networkmanagerapplet # network stuff
    xdg-desktop-portal-gtk # needed for certin apps to not fail
    wl-clipboard cliphist # wayland clipboard manager
    hyprpicker # color selectord
    playerctl # music player controller
    pulseaudio # pulseaudio
    pulsemixer # pulseaudio mixer

    wlsunset # screen color temperature
    (pkgs.writeScriptBin "sct" ''
      #!/run/current-system/sw/bin/bash
      pkill wlsunset
      if [ $# -eq 1 ]; then
        temphigh=$(( $1 + 1 ))
        templow=$1
        wlsunset -t $templow -T $temphigh &> /dev/null &
      else
        pkill wlsunset
      fi
    '')
  ];
  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  
  wayland.windowManager.hyprland = {
    enable = true;

    #enableNvidiaPatches = false;
    systemd.enable = true;

  };
}
