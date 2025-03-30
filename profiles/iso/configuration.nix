{ pkgs, modulesPath, systemSettings, ... }: {
  
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  nixpkgs.hostPlatform = systemSettings.system;

  environment.systemPackages = with pkgs; [
    vim
    nh
    zsh
    git
  ];
}
