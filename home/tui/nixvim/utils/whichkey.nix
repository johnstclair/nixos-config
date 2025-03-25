{
  programs.nixvim = {
  plugins.which-key = {
    enable = true;
    # registrations = {
    #   "<leader>t" = " Terminal";
    # };
    settings = {
      win = {
        border = "none";
      };
      icons = {
        breadcrumb = "»";
        group = "+";
        separator = ""; # ➜
      };
    };
  };
  };
}
