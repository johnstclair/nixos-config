{ inputs, pkgs, ... }: 
{
  imports = [
    ./variables.nix
    ./settings.nix
    ../wofi/default.nix # wofi app launcher
    ../waybar/default.nix # waybar
    ../swaync/default.nix # notifcations
    ../swaylock/default.nix # lock screen
  ];

  home.packages = with pkgs; [
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast
    networkmanagerapplet # network stuff
    xdg-desktop-portal-gtk # needed for certin apps to not fail
    hyprpicker
  ];
  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
      #hidpi = true;
    };
    #enableNvidiaPatches = false;
    systemd.enable = true;

  };
}
