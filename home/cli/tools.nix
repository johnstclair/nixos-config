{ pkgs, ... }: {
  home.packages = with pkgs; [
    fzf
    unzip zip
    acpi
    tmux
    openssl
    bat
    ripgrep
    pomodoro
    imagemagick
    yt-dlp
  ];
}
