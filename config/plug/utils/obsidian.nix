{ lib, ... }: {
  plugins.obsidian = {
    enable = true;
    settings = {
      completion = {
        min_chars = 2;
        nvim_cmp = true;
      };
      new_notes_location = "current_dir";
      workspaces = [
        {
          name = "Notes";
          path = "~/notes";
        }
      ];
      mappings = {
        of = {
          action = "require('obsidian').util.gf_passthrough";
          opts = {
            noremap = false;
            expr = true;
            buffer = true;
          };
        };
        "<leader>od" = {
          action = "require('obsidian').util.toggle_checkbox";
          opts.buffer = true;
        };
      };
      templates = {
        subdir = "templates";
        date_format = "%Y-%m-%d-%a";
        time_format = "%H:%M";
        tags = "";
      };
    };
  };
}
