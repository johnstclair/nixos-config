{ pkgs, ... } : {
  imports = [
    ./cava.nix
  ];

  home.packages = with pkgs; [
    lolcat cowsay 
    cmatrix cbonsai pipes
    onefetch disfetch
  ];
}
