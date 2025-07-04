{
  plugins.gitlinker = {
    enable = true;
    callbacks = {
      "github.com" = "get_github_type_url";
    };
    mappings = {
      gy = {
        mode = [ "n" "v" ];
        action = "require('gitlinker').get_buf_range_url";
      };
      gY = {
        mode = "n";
        action = "require('gitlinker').get_repo_url";
      };
      gB = {
        mode = "n";
        action = "require('gitlinker').get_repo_url({action_callback = require'gitlinker.actions'.open_in_browser})";
      };
    };
  };
}
