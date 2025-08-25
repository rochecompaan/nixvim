{
  plugins.neogit = {
    enable = true;
    settings = {
      integrations = {
        diffview = true;
      };
    };
    # Optional configuration can be added here
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
