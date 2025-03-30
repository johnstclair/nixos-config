{ pkgs, ... } : {
  home.packages = with pkgs; [
    tt
    htop 
  ];
}
