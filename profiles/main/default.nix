{ config, pkgs, userSettings, systemSettings, inputs, ... }:

{
  imports =
    [
      ../../modules/system/de/default.nix # desktop envoirment
      ../../modules/system/graphics/${systemSettings.graphicsDriver}.nix 
      ../../modules/system/steam/default.nix # steam
    ];

  # bootloader
  # Use systemd-boot if uefi, default to grub otherwise
  boot.loader.systemd-boot.enable = if (systemSettings.bootMode == "uefi") then true else false;
  boot.loader.efi.canTouchEfiVariables = if (systemSettings.bootMode == "uefi") then true else false;
  boot.loader.efi.efiSysMountPoint = systemSettings.bootMountPath; # does nothing if running bios rather than uefi
  boot.loader.grub.enable = if (systemSettings.bootMode == "uefi") then false else true;
  boot.loader.grub.device = systemSettings.grubDevice; # does nothing if running uefi rather than bios


  # flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # networking
  networking.hostName = systemSettings.hostname;
  networking.networkmanager.enable = true;

  # timezone
  time.timeZone = systemSettings.timezone;

  # locale (langauage) stuff
  i18n.defaultLocale = systemSettings.locale;

  i18n.extraLocaleSettings = {
    LC_ADDRESS = systemSettings.locale;
    LC_IDENTIFICATION = systemSettings.locale;
    LC_MEASUREMENT = systemSettings.locale;
    LC_MONETARY = systemSettings.locale;
    LC_NAME = systemSettings.locale;
    LC_NUMERIC = systemSettings.locale;
    LC_PAPER = systemSettings.locale;
    LC_TELEPHONE = systemSettings.locale;
    LC_TIME = systemSettings.locale;
  };

  # Window Stuff
  services.displayManager.sddm.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.name;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # zsh setup
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # Accept Nvidia terms for drivers
  nixpkgs.config.nvidia.acceptLicense = true;

  # xremap stuff
  hardware.uinput.enable = true;
  users.groups.uinput.members = [ userSettings.username ];
  users.groups.input.members = [ userSettings.username ];

  environment.systemPackages = with pkgs; [
    vim
    nh
    zsh
    git
    nodejs
    python3
    gparted
    appimage-run
    balena-cli
    chromium
  ];

  fonts.packages = with pkgs; [
    nerdfonts
  ];

  system.stateVersion = "24.05"; # Did you read the comment? -- No

}
