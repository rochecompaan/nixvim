{
  plugins.treesitter-textobjects = {
    enable = true;
    select = {
      enable = true;
      lookahead = true;
      keymaps = {
        "aa" = "@parameter.outer";
        "ia" = "@parameter.inner";
        "af" = "@function.outer";
        "if" = "@function.inner";
        "ac" = "@class.outer";
        "ic" = "@class.inner";
        "ii" = "@conditional.inner";
        "ai" = "@conditional.outer";
        "il" = "@loop.inner";
        "al" = "@loop.outer";
        "at" = "@comment.outer";
      };
    };
    move = {
      enable = true;
      gotoNextStart = {
        "<leader>j" = "@function.outer";
        "<leader>jj" = "@class.outer";
      };
      gotoNextEnd = {
        "<leader>l" = "@function.outer";
        "<leader>ll" = "@class.outer";
      };
      gotoPreviousStart = {
        "<leader>k" = "@function.outer";
        "<leader>kk" = "@class.outer";
      };
      gotoPreviousEnd = {
        "<leader>h" = "@function.outer";
        "<leader>hh" = "@class.outer";
      };
    };
    swap = {
      enable = true;
      swapNext = {
        "<leader>a" = "@parameters.inner";
      };
      swapPrevious = {
        "<leader>A" = "@parameter.outer";
      };
    };
  };
}
