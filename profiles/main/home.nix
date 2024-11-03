{ config, inputs, pkgs, userSettings, ... }:

{
  home.username = userSettings.username;
  home.homeDirectory = "/home/${userSettings.username}";

  programs.home-manager.enable = true;

  imports = [
    ../../modules/home/hyprland/default.nix # hyprland
    ../../modules/home/shell/default.nix # zsh config
    ../../modules/home/xremap/default.nix # keybindings
    ../../modules/home/nixvim/default.nix # neovim
    ../../modules/home/style/stylix.nix # styles
    ( ../../modules/home/terminal/${userSettings.term}.nix ) # terminal
    ../../modules/home/vscode/default.nix # vscode 
    ../../modules/home/communication/default.nix # discord and slack
    ../../modules/home/browser/default.nix # zen
  ];

  home.stateVersion = "24.05"; # Do not change before reading docs

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    zsh
    git gh
    qmk
    gnumake
  ];

  home.sessionVariables = {
    FLAKE = "home/${userSettings.username}/${userSettings.dotfilesDir}";
    TERMINAL = userSettings.term;
  };
}
