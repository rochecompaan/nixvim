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
    require('livepreview.config').set({
      dynamic_root = true,
    })
  '';
}
