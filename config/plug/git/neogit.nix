{
  plugins.neogit = {
    enable = true;
    settings = {
      commit_popup = {
        kind = "floating";
      };
      disable_builtin_notifications = true;
      disable_commit_confirmation = true;
      integrations = {
        diffview = true;
      };
      kind = "floating";
      popup = {
        kind = "floating";
      };
      preview_buffer = {
        kind = "floating";
      };
      sections = {
        recent = {
          folded = true;
        };
        staged = {
          folded = false;
        };
        stashes = {
          folded = true;
        };
        unmerged = {
          folded = true;
        };
        unpulled = {
          folded = false;
        };
        unstaged = {
          folded = false;
        };
        untracked = {
          folded = false;
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>Neogit<CR>";
      options = {
        desc = "Neogit";
      };
    }
  ];
}
