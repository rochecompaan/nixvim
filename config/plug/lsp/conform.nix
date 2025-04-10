{
  plugins.conform-nvim = {
    enable = true;
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

      # Add the formatters section with custom configuration
      formatters = {
        black = {
          command = ""; # Will be set by the Lua function
        };
      };
    };
  };

  extraConfigLua = ''
    -- Function to get command from virtual environment if available
    local function get_venv_command(command)
      if vim.env.VIRTUAL_ENV then
        return vim.env.VIRTUAL_ENV .. "/bin/" .. command
      else
        return command
      end
    end

    -- Configure formatters to use virtual environment when available
    require('conform').formatters.black = {
      command = get_venv_command("black")
    }
  '';
}
