{
  plugins.lazygit = {
    enable = true;
  };

  extraConfigLua = ''
    -- Ensure child processes (like LazyGit) can find the current Neovim instance
    local function set_nvim_env()
      local addr = vim.v.servername
      if addr and #addr > 0 then
        vim.env.NVIM_LISTEN_ADDRESS = addr
        vim.env.NVIM = addr
      end
    end

    -- Set it at startup for all future child processes
    set_nvim_env()

    -- Provide a wrapper command that guarantees env is set just before launch
    vim.api.nvim_create_user_command("LazyGitWithEnv", function()
      set_nvim_env()
      vim.cmd("LazyGit")
    end, {})

    -- Load telescope-lazygit if available
    pcall(function()
      require("telescope").load_extension("lazygit")
    end)
  '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>LazyGitWithEnv<CR>";
      options = {
        desc = "LazyGit (root dir)";
      };
    }
  ];
}
