{
  # ---- SYSTEM SETTINGS ---- #
  systemSettings = {
    system = "x86_64-linux"; # arch
    hostname = "hostname"; # hostname
    profile = "main"; # profile
    timezone = "America/Chicago"; # time
    locale = "en_US.UTF-8"; # locale
    bootMode = "uefi"; # uefi or bios
    bootMountPath = "/boot"; # mount path for efi boot partition; only used for uefi boot mode
    grubDevice = ""; # device identifier for grub; only used for bios boot mode
    graphicsDriver = "none"; # nouveau, none, or nvidia
    nvidiaVersion = "stable"; # driver version, ONLY IF graphicsDriver IS NVIDIA, check - https://nixos.wiki/wiki/Nvidia
    desktopEnvironment = "hyprland"; # DE/WM, kde, i3, or hyprland
  };
  # ----- USER SETTINGS ----- #
  userSettings = {
    username = "USERNAME"; # username
    name = "NAME"; # name
    dotfilesDir = "~/.nixos-config"; # path of local dotfiles 
    term = "ghostty";
    editor = "neovim"; # neovim; default editor
    theme = "gruvbox-material-dark-soft"; # theme name from themes folder
    primaryAccentColor = "D"; # a hex of your base16 theme
    secondaryAccentColor = "E"; # a hex of your base16 theme
    background = "1.png"; # background number and filetype
    font = "JetBrainsMono Nerd Font"; # font
    xserverDisplaySizeMultipler = 2; # adjusts the screen dpi and terminal font size while using xserver

    # the following settings are for hyprland only
    sensitivity = "0"; # mouse sens val between -1,1
    # these are the hypr monitor settings, also put the workspace rules here
    monitorSettings = ''
      monitor=DP-1,1920x1080@60,0x0,1
      monitor=DP-2,1920x1080@60,1920x0,1

      workspace = 1, monitor:DP-1
      workspace = 2, monitor:DP-1
      workspace = 3, monitor:DP-1
      workspace = 4, monitor:DP-1
      workspace = 5, monitor:DP-1
      workspace = 6, monitor:DP-2
      workspace = 7, monitor:DP-2
      workspace = 8, monitor:DP-2
      workspace = 9, monitor:DP-2
      workspace = 0, monitor:DP-2
    '';
  };
}
