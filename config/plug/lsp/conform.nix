{
  plugins.conform-nvim = {
    enable = false;
    settings = {
      format_on_save = {
        lspFallback = false;
        timeoutMs = 500;
      };
      formatters_by_ft = {
        html = [ [ "prettierd" "prettier" ] ];
        css = [ [ "prettierd" "prettier" ] ];
        javascript = [ [ "prettierd" "prettier" ] ];
        javascriptreact = [ [ "prettierd" "prettier" ] ];
        typescript = [ [ "prettierd" "prettier" ] ];
        typescriptreact = [ [ "prettierd" "prettier" ] ];
        python = [ "black" ];
        lua = [ "stylua" ];
        nix = [ "nixpkgs-fmt" ];
        markdown = [ [ "prettierd" "prettier" ] ];
        yaml = [ "yamllint" "yamlfmt" ];
        "*" = [ "codespell" ];
        # Use the "_" filetype to run formatters on filetypes that don't
        # have other formatters configured.
        "_" = [ "trim_whitespace" ];
      };
      notify_on_error = true;
    };
  };
}
