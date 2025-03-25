{ pkgs, userSettings, systemSettings, ... }:

{
  home.username = userSettings.username;
  home.homeDirectory = "/home/${userSettings.username}";

  programs.home-manager.enable = true;

  imports = [
    ( ../../home/wm/${systemSettings.desktopEnvironment}/default.nix ) # hyprland

    ../../home/style/stylix.nix # styles

    ( ../../home/app/terminal/${userSettings.term}.nix ) # terminal
    ../../home/app/design/gimp.nix # gimp 
    ../../home/app/design/inkscape.nix # inkscape 
    ../../home/app/communication/default.nix # discord and slack
    ../../home/app/browser/default.nix # browser
    ../../home/app/code.nix # i swear i only use it for bqn/uiua
    ../../home/app/spotube.nix # spotify and youtube audio client

    ../../home/cli/tools.nix # cli tools
    ../../home/cli/rice.nix # programs commonly featured in rices
    ../../home/cli/git.nix # git settings
    ../../home/cli/zoxide.nix # better cd
    ../../home/cli/shell.nix # zsh config
    ../../home/cli/fabric.nix # ai tool

    ../../home/tui/nixvim/default.nix # neovim
    ../../home/tui/yazi.nix # file explorer
    ../../home/tui/misc.nix # misc tui apps

    ../../home/service/glance/glance.nix # feed agrogater client

    ../../home/languages/cc/cc.nix # c compiler
    ../../home/languages/rust/rust.nix # rustup
    ../../home/languages/nodejs/nodejs.nix # node and web dev
    ../../home/languages/python/python.nix # python
    ../../home/languages/nix/nix.nix # nix tools
    ../../home/languages/godot/godot.nix # game engine
    ../../home/languages/apl/apl.nix # a programming language
    ../../home/languages/bqn/bqn.nix # big question notation
    ../../home/languages/uiua/uiua.nix # im collecting all of the array programming langauges
  ];

  home.stateVersion = "24.05"; # Do not change before reading docs

  # Sorry Stallman
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    zsh
    git gh
    gnumake
  ];

  home.sessionVariables = {
    FLAKE = "home/${userSettings.username}/${userSettings.dotfilesDir}";
    TERMINAL = userSettings.term;
  };
}
