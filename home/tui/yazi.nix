{ pkgs, ... } : {
  home.packages = with pkgs; [
    yazi
    imagemagick
  ];
}
