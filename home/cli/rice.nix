{ pkgs, ... } : {
  home.packages = with pkgs; [
    lolcat cowsay 
    cava cmatrix cbonsai pipes
    onefetch disfetch
  ];
}
