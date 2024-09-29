{ config
, lib
, pkgs
, ...
}: {
  imports = [
    ./autocommands.nix
    ./keys.nix
    ./sets.nix
    ./highlight.nix

    ./plug/colorscheme/biscuit.nix
    ./plug/colorscheme/colorscheme.nix

    ./plug/completion/cmp.nix
    ./plug/completion/copilot-cmp.nix
    ./plug/completion/lspkind.nix
    ./plug/completion/schemastore.nix

    ./plug/git/fugitive.nix
    ./plug/git/gitlinker.nix
    ./plug/git/gitsigns.nix
    ./plug/git/lazygit.nix
    ./plug/git/worktree.nix

    ./plug/lsp/conform.nix
    ./plug/lsp/fidget.nix
    ./plug/lsp/hlchunk.nix
    ./plug/lsp/lsp.nix
    ./plug/lsp/lspsaga.nix
    ./plug/lsp/none-ls.nix
    ./plug/lsp/trouble.nix

    ./plug/snippets/luasnip.nix

    ./plug/statusline/lualine.nix

    #./plug/treesitter/treesitter-context.nix
    ./plug/treesitter/treesitter-textobjects.nix
    ./plug/treesitter/treesitter.nix

    ./plug/ui/btw.nix
    ./plug/ui/indent-blankline.nix
    ./plug/ui/telescope.nix

    #./plug/utils/harpoon.nix
    ./plug/utils/auto-session.nix
    ./plug/utils/comment.nix
    ./plug/utils/copilot.nix
    ./plug/utils/hardtime.nix
    ./plug/utils/illuminate.nix
    ./plug/utils/mini.nix
    ./plug/utils/nvim-autopairs.nix
    ./plug/utils/obsidian.nix
    ./plug/utils/oil.nix
    ./plug/utils/ufo.nix
    ./plug/utils/undotree.nix
    ./plug/utils/whichkey.nix
    ./plug/utils/yaml-companion.nix
  ];
  options = {
    theme = lib.mkOption {
      default = lib.mkDefault "paradise";
      type = lib.types.enum [ "paradise" "decay" "edge-dark" "mountain" "tokyonight" "everforest" "everblush" "jellybeans" "aquarium" "gruvbox" ];
    };
    assistant = lib.mkOption {
      default = "none";
      type = lib.types.enum [ "copilot" "none" ];
    };
  };
  config = {
    # The base16 theme to use, if you want to use another theme, change it in colorscheme.nix
    theme = "paradise";
    extraConfigLua = ''
      _G.theme = "${config.theme}";
      require('render-markdown').setup({});
    '';
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "markdown.nvim";
        src = pkgs.fetchFromGitHub {
          owner = "MeanderingProgrammer";
          repo = "markdown.nvim";
          rev = "HEAD";
          hash = "sha256-BhITxvogH5hHO5m1SGNP1sT/jMjaQ0uNqg2ScsyZ/pU=";
        };
      })
    ];

  };
}
