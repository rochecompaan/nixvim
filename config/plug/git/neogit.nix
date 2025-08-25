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
