{ ... }: {
  programs.git = {
    enable = true;
    aliases = {
      ps = "push";
      pl = "pull";
      st = "status";
      ll = "log --oneline";
      cm = "commit -m";
      cam = "commit  -am";
      d = "diff";
    };
  };
}
