{
  programs.nixvim = {
  plugins.lualine = {
    enable = false;
    settings = {
      extensions = ["fzf"];
      sections = {
        lualine_a = ["mode"];
        lualine_b = [
          {
            name = "branch";
            icon = "";
          }
          "diff"
          "diagnostics"
        ];
        lualine_c = ["filename"];
        lualine_x = ["filetype"];
        lualine_y = ["progress"];
        lualine_z = [''" " .. os.date("%R")''];
      };
      options = {
        alwaysDivideMiddle = true;
        globalstatus = true;
        ignoreFocus = ["neo-tree"];
        theme = "auto";
        componentSeparators = {
          left = "|";
          right = "|";
        };
        sectionSeparators = {
          left = "█"; # 
          right = "█"; # 
        };
      };
    };
  };
  };
}
