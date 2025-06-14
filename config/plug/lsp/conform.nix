{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = ''
        function(bufnr)
          if vim.g.disable_autoformat or (vim.b[bufnr] and vim.b[bufnr].disable_autoformat) then
            return
          end
          return {
            timeout_ms = 500,
            lsp_fallback = false
          }
        end
      '';
      formatters_by_ft = {
        html = [ "prettierd" "prettier" ];
        css = [ "prettierd" "prettier" ];
        javascript = [ "prettierd" "prettier" ];
        javascriptreact = [ "prettierd" "prettier" ];
        typescript = [ "prettierd" "prettier" ];
        typescriptreact = [ "prettierd" "prettier" ];
        python = [ "black" ];
        lua = [ "stylua" ];
        nix = [ "nixfmt-rfc-style" ];
        markdown = [ "prettierd" "prettier" ];
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

    -- Added for formatting toggle
    vim.api.nvim_create_user_command('FormatDisable', function(args)
      if args.bang then
        -- :FormatDisable! disables autoformat for this buffer only
        vim.b.disable_autoformat = true
      else
        -- :FormatDisable disables autoformat globally
        vim.g.disable_autoformat = true
      end
    end, {
      desc = 'Disable autoformat-on-save',
      bang = true, -- allows the ! variant
    })

    vim.api.nvim_create_user_command('FormatEnable', function()
      -- Clears both buffer and global disable flags
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = 'Re-enable autoformat-on-save',
    })

    -- Keymaps for toggling autoformat
    local leader = vim.g.mapleader
    if leader == nil then
      leader = " " -- Default to space if mapleader is not set
    end

    vim.keymap.set('n', leader .. 'tf', function()
      if vim.b.disable_autoformat then
        vim.cmd 'FormatEnable'
        vim.notify 'Enabled autoformat for current buffer'
      else
        vim.cmd 'FormatDisable!'
        vim.notify 'Disabled autoformat for current buffer'
      end
    end, { desc = 'Toggle autoformat for current buffer', silent = true })

    vim.keymap.set('n', leader .. 'tF', function()
      if vim.g.disable_autoformat then
        vim.cmd 'FormatEnable'
        vim.notify 'Enabled autoformat globally'
      else
        vim.cmd 'FormatDisable'
        vim.notify 'Disabled autoformat globally'
      end
    end, { desc = 'Toggle autoformat globally', silent = true })
  '';
}
