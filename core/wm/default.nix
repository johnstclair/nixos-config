{ systemSettings, ... } : {
  imports = [
    ./${systemSettings.desktopEnvironment}/default.nix
  ];
}
