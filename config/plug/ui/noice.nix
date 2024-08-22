{
  plugins.noice = {
    enable = false;
    notify = {
      enabled = false;
    };
    messages = {
      enabled = false; # Adds a padding-bottom to neovim statusline when set to false for some reason
    };
    lsp = {
      message = {
        enabled = false;
      };
      progress = {
        enabled = false;
        view = "mini";
      };
    };
    popupmenu = {
      enabled = false;
      backend = "nui";
    };
    format = {
      filter = {
        pattern = [ ":%s*%%s*s:%s*" ":%s*%%s*s!%s*" ":%s*%%s*s/%s*" "%s*s:%s*" ":%s*s!%s*" ":%s*s/%s*" ];
        icon = "";
        lang = "regex";
      };
      replace = {
        pattern = [ ":%s*%%s*s:%w*:%s*" ":%s*%%s*s!%w*!%s*" ":%s*%%s*s/%w*/%s*" "%s*s:%w*:%s*" ":%s*s!%w*!%s*" ":%s*s/%w*/%s*" ];
        icon = "󱞪";
        lang = "regex";
      };
    };
  };
}
