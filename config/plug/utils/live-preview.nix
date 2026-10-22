{ pkgs, ... }: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "live-preview.nvim";
      version = "0.9.7";
      # Upstream's self-test assumes an install path ending in live-preview.nvim.
      nvimSkipModules = [ "livepreview._spec" ];
      src = pkgs.fetchFromGitHub {
        owner = "brianhuster";
        repo = "live-preview.nvim";
        rev = "a6307fa340ed7c0d96f5c567afc8c991aad94ce0";
        hash = "sha256-xyeoz4lEqrinkqY5U4Fu1S2HlmCyXiNQ2l2+AJFozIc=";
      };
    })
  ];

  extraConfigLua = ''
    local preview = require('livepreview')
    local preview_config = require('livepreview.config')
    preview_config.set({
      dynamic_root = true,
    })

    local start_preview = preview.start
    preview.start = function(filepath)
      -- Bind port 0 so the OS reserves a free port for this preview.
      local started = start_preview(filepath, 0)
      if started then
        -- Update in place: the command uses this table to build the browser URL.
        preview_config.config.port = preview.serverObj.server:getsockname().port
      end
      return started
    end
  '';
}
