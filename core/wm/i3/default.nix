{
  pkgs,
  ...
}:

{
  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw
  services.dbus.packages = with pkgs; [ dconf ];

  services.xserver = {
    enable = true;

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        xclip
        autotiling
        feh
        picom-next
      ];
    };

    desktopManager.xterm.enable = false;
    excludePackages = [ pkgs.xterm ];

    dpi = 120;
    upscaleDefaultCursor = true;

    autorun = false;
    displayManager.startx.enable = true;
    displayManager.lightdm.enable = false;
  };

  services.displayManager.defaultSession = "none+i3";
}
