{ pkgs, modulesPath, systemSettings, ... }: {
  
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  nixpkgs.hostPlatform = systemSettings.system;
}
