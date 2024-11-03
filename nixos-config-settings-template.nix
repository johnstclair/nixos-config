{
  # ---- SYSTEM SETTINGS ---- #
  systemSettings = {
    system = "x86_64-linux"; # arch
    hostname = "old-theo"; # hostname
    profile = "main"; # profile
    timezone = "America/Chicago"; # time
    locale = "en_US.UTF-8"; # locale
    bootMode = "uefi"; # uefi or bios
    bootMountPath = "/boot"; # mount path for efi boot partition; only used for uefi boot mode
    grubDevice = ""; # device identifier for grub; only used for bios boot mode
    graphicsDriver = "nouveau"; # nouveau or nvidia
    nvidiaVersion = "stable"; # driver version, ONLY IF graphicsDriver IS NVIDIA, check - https://nixos.wiki/wiki/Nvidia
    desktopEnvoirment = "hyprland"; # DE, kde or hyprland
  };
  # ----- USER SETTINGS ----- #
  userSettings = {
    username = "USERNAME"; # username
    name = "NAME"; # name
    dotfilesDir = "~/.nixos-config"; # path of local dotfiles 
    term = "alacritty";
    editor = "neovim"; # neovim; default editor
    theme = "nord"; # theme name from themes folder
    background = "1"; # background number, most themes ONLY HAVE ONE background
    font = "JetBrainsMono Nerd Font"; # font

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
