{ pkgs, ... } : {
  home.packages = with pkgs; [
    rustup
    bacon
  ];

  home.sessionPath = [
    "$HOME/.cargo/bin/"
  ];
}
