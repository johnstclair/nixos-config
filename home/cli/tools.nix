{ pkgs, ... }: {
  home.packages = with pkgs; [
    fzf
    unzip zip
    tmux
    openssl
    bat
    ripgrep
    pomodoro
    imagemagick
    yt-dlp
  ];
}
