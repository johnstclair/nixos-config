{inputs, ...} :
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./sets.nix
    ./keymaps.nix

    ./bufferlines/bufferline.nix

    ./completion/cmp.nix
    ./completion/lspkind.nix

    ./dap/dap.nix

    ./filetrees/neo-tree.nix
    ./git/gitsigns.nix
    ./git/diffview.nix
    #./git/lazygit.nix
    ./git/neogit.nix

    ./languages/nvim-lint.nix
    ./languages/typescript-tools-nvim.nix
    ./languages/treesitter/treesitter.nix
    ./languages/treesitter/treesitter-context.nix
    ./languages/treesitter/treesitter-textobjects.nix
    ./languages/treesitter/ts-autotag.nix
    ./languages/treesitter/ts-context-commentstring.nix

    ./lsp/conform.nix
    #./lsp/fidget.nix
    ./lsp/lsp.nix
    ./lsp/lspsaga.nix
    ./lsp/trouble.nix

    ./none-ls/none-ls.nix

    ./snippets/luasnip.nix

    ./statusline/lualine.nix
    ./statusline/staline.nix

    ./telescope/telescope.nix

    ./ui/alpha.nix
    ./ui/dressing-nvim.nix
    ./ui/indent-blankline.nix
    ./ui/noice.nix
    ./ui/nvim-notify.nix
    ./ui/nui.nix

    ./utils/better-escape.nix
    #./utils/neocord.nix
    ./utils/flash.nix
    ./utils/hardtime.nix
    ./utils/harpoon.nix
    ./utils/illuminate.nix
    ./utils/markdown-preview.nix
    ./utils/mini.nix
    ./utils/neodev.nix
    ./utils/nvim-autopairs.nix
    ./utils/nvim-colorizer.nix
    ./utils/nvim-surround.nix
    ./utils/oil.nix
    ./utils/persistence.nix
    ./utils/plenary.nix
    ./utils/fzf-lua.nix
    ./utils/project-nvim.nix
    ./utils/sidebar.nix
    ./utils/tmux-navigator.nix
    ./utils/todo-comments.nix
    ./utils/toggleterm.nix
    ./utils/ultimate-autopair.nix
    ./utils/undotree.nix
    ./utils/vim-be-good.nix
    #./utils/wakatime.nix
    ./utils/whichkey.nix
    ./utils/wilder.nix
  ];

  home.shellAliases.v = "nvim";

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    plugins.web-devicons.enable = true;

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;
  };
}
