{ pkgs, config, userSettings, ... }:
let

  # my shel aliases
  myAliases = {
    ps = "git push";
    pl = "git pull";
    update-home = "nh home switch -b backup -c user ${userSettings.dotfilesDir}";
    update-system = "nh os switch -H system ${userSettings.dotfilesDir}";
    sleep = "swaylock & systemctl suspend";
 };
in
{
  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    shellAliases = myAliases;

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [
      "--cmd cd"
    ];
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$shlvl$shell$username$hostname$nix_shell$git_branch$git_commit$git_state$git_status$directory$jobs$cmd_duration$character";
      shlvl = {
        disabled = false;
        symbol = "ﰬ";
      };
      shell = {
        disabled = false;
        format = "$indicator";
        zsh_indicator = "[ZSH](bright-white) ";
      };
      username = {
        style_user = "bright-white bold";
        style_root = "bright-red bold";
      };
    };
  };

  home.packages = with pkgs; [
    lolcat cowsay cava cmatrix
    onefetch disfetch
    zoxide fzf
    htop tmux
  ];
}
