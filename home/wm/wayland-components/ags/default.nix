{ inputs, pkgs, config, userSettings, ... } : {
  imports = [
    inputs.ags.homeManagerModules.default
    ./style.nix
  ];

  home.packages = with pkgs; [
    bun 
  ];

  programs.ags = {
    enable = true;
    configDir = ./config;
  };
}
