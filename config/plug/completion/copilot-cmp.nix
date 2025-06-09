{
  plugins.copilot-cmp = {
    enable = true;
  };
  plugins.copilot-lua = {
    enable = true;
    settings = {
      panel = { enabled = false; };
      suggestion = { enabled = false; };
    };
  };

  extraConfigLua = ''
    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
    })
  '';
}
