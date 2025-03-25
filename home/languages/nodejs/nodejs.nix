{ pkgs, ... } : {
  home.packages = with pkgs; [
    nodejs

    # linter
    eslint_d
  ];
}
