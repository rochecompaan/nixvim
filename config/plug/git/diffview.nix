{
  plugins.diffview = {
    enable = true;
    enhancedDiffHl = true;
    view.default.layout = "diff2_horizontal";
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>gv";
      action = "+diffview";
    }
    {
      mode = "n";
      key = "<leader>gvd";
      action = "<cmd>DiffviewOpen<CR>";
      options = {
        silent = true;
        desc = "Diffview: Open current changes";
      };
    }
    {
      mode = "n";
      key = "<leader>gvb";
      action = "<cmd>DiffviewOpen main...HEAD<CR>";
      options = {
        silent = true;
        desc = "Diffview: Branch vs main";
      };
    }
    {
      mode = "n";
      key = "<leader>gvo";
      action = ":DiffviewOpen ";
      options = {
        desc = "Diffview: Open with args";
      };
    }
    {
      mode = "n";
      key = "<leader>gvc";
      action = "<cmd>DiffviewClose<CR>";
      options = {
        silent = true;
        desc = "Diffview: Close";
      };
    }
    {
      mode = "n";
      key = "<leader>gvh";
      action = "<cmd>DiffviewFileHistory %<CR>";
      options = {
        silent = true;
        desc = "Diffview: Current file history";
      };
    }
  ];
}
