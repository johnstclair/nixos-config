{ pkgs, ... } : {
  home.packages = with pkgs; [
    uiua
    uiua386
  ];

  programs.vscode.profiles.default.extensions = with pkgs.vscode-extensions; [
    uiua-lang.uiua-vscode
  ];
}
