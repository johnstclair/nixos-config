{ userSettings, pkgs, ... } : {
  programs.dconf.enable = true;

  fonts.packages = with pkgs; [
    font-awesome
  ];

  services.xserver = {
    enable = true;

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        xclip
        autotiling
        feh
        picom
      ];
    };

    desktopManager.xterm.enable = false;
    excludePackages = [ pkgs.xterm ];

    dpi = 94 * userSettings.xserverDisplaySizeMultipler;
    upscaleDefaultCursor = true;

    autorun = false;
    displayManager.startx.enable = false;
    displayManager.lightdm.enable = false;
  };

  services.displayManager.defaultSession = "none+i3";
}
