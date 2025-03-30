{
  programs.nixvim = {
  plugins.fzf-lua = {
    enable = true;
    
    keymaps = {
    "<leader>/" = {
      action = "live_grep";
      options.desc = "Live Grep";
    };
    };
  };
  };
}
