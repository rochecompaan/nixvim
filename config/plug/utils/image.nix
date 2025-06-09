{
  plugins.image = {
    enable = true;
    settings = {
      backend = "kitty";
      markdown = {
        only_render_image_at_cursor = true;
        only_render_image_at_cursor_mode = "popup";
        download_remote_images = true;
        enabled = true;
        floating_windows = true;
      };
      max_height = null;
      max_height_window_percentage = {
        __raw = "math.huge";
      };
      max_width = null;
      max_width_window_percentage = {
        __raw = "math.huge";
      };
      window_overlap_clear_enabled = false;
      window_overlap_clear_ft_ignore = [
        "cmp_menu"
        "cmp_docs"
        ""
      ];
    };
  };
}
