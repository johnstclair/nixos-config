{ pkgs, ... } : {
  home.packages = with pkgs; [
    statix # linter
  ];
}
