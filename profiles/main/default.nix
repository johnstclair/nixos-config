{ config, options, pkgs, userSettings, systemSettings, inputs, ... } : let 
     tokyo-night-sddm = pkgs.libsForQt5.callPackage ../../pkgs/tokyo-night-sddm-theme.nix { };
in {
  imports =
    [
      ../../core/wm/default.nix # desktop environment

      ../../core/hardware/graphics/${systemSettings.graphicsDriver}.nix 

      ../../core/services/searxng.nix # metasearch engine

      ../../core/app/steam.nix # steam

      ../../core/cli/ollama.nix # llms
      ../../core/cli/docker.nix # docker

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

  powerManagement.enable = true;

  # networking
  networking.hostName = systemSettings.hostname;
  networking.networkmanager.enable = true;

  networking.firewall = rec {
    allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };

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

  services.displayManager.sddm.wayland.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.theme = "tokyo-night-sddm"; 
  # services.displayManager.ly = {
  #   enable = true;
  #   settings = {
  #     animation = "doom";
  #     blank_box = false;
  #     bg = "0x00FF00FF";
  #   };
  # };

  services.xserver.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
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

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # zsh setup
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # Accept Nvidia terms for drivers
  nixpkgs.config.nvidia.acceptLicense = true;

  hardware.uinput.enable = true;
  users.groups.uinput.members = [ userSettings.username ];
  users.groups.input.members = [ userSettings.username ];

  # TODO: remove this
  programs.nix-ld.enable = true;
  # https://github.com/nix-community/nix-index-database
  programs.nix-ld.libraries = options.programs.nix-ld.libraries.default ++ (with pkgs; [
        stdenv.cc.cc
        openssl
        xorg.libXcomposite
        xorg.libXtst
        xorg.libXrandr
        xorg.libXext
        xorg.libX11
        xorg.libXfixes
        libGL
        libva
        xorg.libxcb
        xorg.libXdamage
        xorg.libxshmfence
        xorg.libXxf86vm
        libelf
        
        # Required
        glib
        gtk2
        bzip2
        
        # Without these it silently fails
        xorg.libXinerama
        xorg.libXcursor
        xorg.libXrender
        xorg.libXScrnSaver
        xorg.libXi
        xorg.libSM
        xorg.libICE
        # gnome2.GConf
        nspr
        nss
        cups
        libcap
        SDL2
        libusb1
        dbus-glib
        ffmpeg
        # Only libraries are needed from those two
        libudev0-shim
        
        # Verified games requirements
        xorg.libXt
        xorg.libXmu
        libogg
        libvorbis
        SDL
        SDL2_image
        glew110
        libidn
        tbb
        
        # Other things from runtime
        flac
        freeglut
        libjpeg
        libpng
        libpng12
        libsamplerate
        libmikmod
        libtheora
        libtiff
        pixman
        speex
        SDL_image
        SDL_ttf
        SDL_mixer
        SDL2_ttf
        SDL2_mixer
        # libdbusmenu-gtk2
        libindicator-gtk2
        libcaca
        libcanberra
        libgcrypt
        libvpx
        librsvg
        xorg.libXft
        libvdpau
        pango
        cairo
        atk
        gdk-pixbuf
        fontconfig
        freetype
        dbus
        alsa-lib
        expat
        # Needed for electron
        libdrm
        mesa
        libxkbcommon
        gtk3.out
  ]);

  nixpkgs.config.permittedInsecurePackages = [
    "SDL_ttf-2.0.11"
  ];

  environment.systemPackages = with pkgs; [
    vim
    nh
    zsh
    git
    bc
    tokyo-night-sddm
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  system.stateVersion = "24.05"; # Did you read the comment? -- No

}
