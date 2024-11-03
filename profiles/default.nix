{ config, pkgs, userSettings, systemSettings, ... }:

{
  imports =
    [
      ../hardware-configuration.nix
      ./${systemSettings.profile} # import profile
    ];
}
