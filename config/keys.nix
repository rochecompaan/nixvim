{
  globals.mapleader = " ";

  keymaps = [
    # General maps

    {
      mode = "n";
      key = "<Tab>";
      action = ":bnext<CR>";
    }

    {
      mode = "n";
      key = "<S-Tab>";
      action = ":bprevious<CR>";
    }

    {
      mode = "n";
      key = "<leader>f";
      action = "+find/file";
    }

    {
      mode = "n";
      key = "<leader>s";
      action = "+search";
    }

    {
      mode = "n";
      key = "<leader>q";
      action = "+quit/session";
    }

    {
      mode = [ "n" "v" ];
      key = "<leader>g";
      action = "+git";
    }

    {
      mode = [ "n" "v" ];
      key = "<leader>gy";
      action = "<cmd>lua require('gitlinker').get_buf_range_url()<CR>";
      options = {
        silent = true;
        desc = "Git: Yank link";
      };
    }

    {
      mode = [ "n" "v" ];
      key = "<leader>go";
      action = "<cmd>lua require('gitlinker').get_buf_range_url('n', {action_callback = require'gitlinker.actions'.open_in_browser})<CR>";
      options = {
        silent = true;
        desc = "Git: Open in remote";
      };
    }

    {
      mode = "n";
      key = "<leader>gY";
      action = "<cmd>lua require('gitlinker').get_repo_url()<CR>";
      options = {
        silent = true;
        desc = "Git: Yank repo URL";
      };
    }

    {
      mode = "n";
      key = "<leader>gB";
      action = "<cmd>lua require('gitlinker').get_repo_url({action_callback = require'gitlinker.actions'.open_in_browser})<CR>";
      options = {
        silent = true;
        desc = "Git: Open repo in browser";
      };
    }

    {
      mode = "n";
      key = "<leader>u";
      action = "+ui";
    }

    {
      mode = "n";
      key = "<leader>w";
      action = "+windows";
    }

    {
      mode = "n";
      key = "<leader><Tab>";
      action = "+tab";
    }

    {
      mode = [ "n" "v" ];
      key = "<leader>d";
      action = "+debug";
    }

    {
      mode = [ "n" "v" ];
      key = "<leader>c";
      action = "+code";
    }

    {
      mode = [ "n" "v" ];
      key = "<leader>t";
      action = "+test";
    }

    # Tabs
    {
      mode = "n";
      key = "<leader><tab><tab>";
      action = "<cmd>tabnew<cr>";
      options = {
        silent = true;
        desc = "New Tab";
      };
    }

    {
      mode = "n";
      key = "<leader><tab>d";
      action = "<cmd>tabclose<cr>";
      options = {
        silent = true;
        desc = "Close tab";
      };
    }

    # Windows
    {
      mode = "n";
      key = "<leader>ww";
      action = "<C-W>p";
      options = {
        silent = true;
        desc = "Other window";
      };
    }

    {
      mode = "n";
      key = "<leader>wd";
      action = "<C-W>c";
      options = {
        silent = true;
        desc = "Delete window";
      };
    }

    {
      mode = "n";
      key = "<leader>w-";
      action = "<C-W>s";
      options = {
        silent = true;
        desc = "Split window below";
      };
    }

    {
      mode = "n";
      key = "<leader>w|";
      action = "<C-W>v";
      options = {
        silent = true;
        desc = "Split window right";
      };
    }

    {
      mode = "n";
      key = "<C-h>";
      action = "<C-W>h";
      options = {
        silent = true;
        desc = "Move to window left";
      };
    }

    {
      mode = "n";
      key = "<C-l>";
      action = "<C-W>l";
      options = {
        silent = true;
        desc = "Move to window right";
      };
    }

    {
      mode = "n";
      key = "<C-k>";
      action = "<C-W>k";
      options = {
        silent = true;
        desc = "Move to window over";
      };
    }

    {
      mode = "n";
      key = "<C-j>";
      action = "<C-W>j";
      options = {
        silent = true;
        desc = "Move to window below";
      };
    }

    {
      mode = "n";
      key = "<C-s>";
      action = "<cmd>w<cr><esc>";
      options = {
        silent = true;
        desc = "Save file";
      };
    }

    # Quit/Session
    {
      mode = "n";
      key = "<leader>qq";
      action = "<cmd>quitall<cr><esc>";
      options = {
        silent = true;
        desc = "Quit all";
      };
    }

    {
      mode = "n";
      key = "<leader>ul";
      action = ":lua ToggleLineNumber()<cr>";
      options = {
        silent = true;
        desc = "Toggle Line Numbers";
      };
    }

    {
      mode = "n";
      key = "<leader>uL";
      action = ":lua ToggleRelativeLineNumber()<cr>";
      options = {
        silent = true;
        desc = "Toggle Relative Line Numbers";
      };
    }

    {
      mode = "n";
      key = "<leader>uw";
      action = ":lua ToggleWrap()<cr>";
      options = {
        silent = true;
        desc = "Toggle Line Wrap";
      };
    }

    {
      mode = "v";
      key = "<C-j>";
      action = ":m '>+1<CR>gv=gv";
      options = { desc = "Use move command when line is highlighted "; };
    }

    {
      mode = "v";
      key = "<C-k>";
      action = ":m '>-2<CR>gv=gv";
      options = { desc = "Use move command when line is highlighted "; };
    }

    {
      mode = "n";
      key = "J";
      action = "mzJ`z";
      options = {
        desc =
          "Allow cursor to stay in the same place after appending to current line ";
      };
    }

    {
      mode = "n";
      key = "<C-d>";
      action = "<C-d>zz";
      options = {
        desc = "Allow C-d and C-u to keep the cursor in the middle";
      };
    }

    {
      mode = "n";
      key = "<C-u>";
      action = "<C-u>zz";
      options = {
        desc = "Allow C-d and C-u to keep the cursor in the middle";
      };
    }

    {
      mode = "n";
      key = "n";
      action = "nzzzv";
      options = { desc = "Allow search terms to stay in the middle "; };
    }

    {
      mode = "n";
      key = "N";
      action = "Nzzzv";
      options = { desc = "Allow search terms to stay in the middle "; };
    }

    # Paste stuff without saving the deleted word into the buffer
    {
      mode = "x";
      key = "<leader>p";
      action = ''"_dP'';
      options = { desc = "Deletes to void register and paste over"; };
    }

    # Copy stuff to system clipboard with <leader> + y or just y to have it just in vim
    {
      mode = [ "n" "v" ];
      key = "<leader>y";
      action = ''"+Y'';
      options = { desc = "Copy to system clipboard"; };
    }

    # Delete to void register
    {
      mode = [ "n" "v" ];
      key = "<leader>D";
      action = ''"_d'';
      options = { desc = "Delete to void register"; };
    }

    # <C-c> instead of pressing esc just because
    {
      mode = "i";
      key = "<C-c>";
      action = "<Esc>";
    }

    {
      mode = "n";
      key = "<leader>onn";
      action = "<cmd>ObsidianNew<CR>";
      options = { desc = "New Note"; };
    }

    {
      mode = "n";
      key = "<leader>y";
      action = ":let @+=expand('%')<CR>";
      options = {
        silent = true;
        desc = "Yank relative file path";
      };
    }

    {
      mode = "n";
      key = "<leader>s";
      action = "[[:%s/<<C-r><C-w>>/<C-r><C-w>/gI<Left><Left><Left>]";
      options = {
        silent = true;
        desc = "Substitute word under cursor";
      };
    }

    {
      mode = "n";
      key = "<A-j>";
      action = ":m .+1<CR>==";
      options = {
        silent = true;
        desc = "Move line down";
      };
    }
    {
      mode = "n";
      key = "<A-k>";
      action = ":m .-2<CR>==";
      options = {
        silent = true;
        desc = "Move line up";
      };
    }
    {
      mode = "v";
      key = "<A-j>";
      action = ":m '>+1<CR>gv=gv";
      options = {
        silent = true;
        desc = "Move selection down";
      };
    }
    {
      mode = "v";
      key = "<A-k>";
      action = ":m '<-2<CR>gv=gv";
      options = {
        silent = true;
        desc = "Move selection up";
      };
    }

  ];
  extraConfigLua = ''
    function ToggleLineNumber()
    if vim.wo.number then
      vim.wo.number = false
    else
      vim.wo.number = true
        vim.wo.relativenumber = false
      end
    end

    function ToggleRelativeLineNumber()
    if vim.wo.relativenumber then
      vim.wo.relativenumber = false
    else
      vim.wo.relativenumber = true
        vim.wo.number = false
      end
    end

    function ToggleWrap()
      vim.wo.wrap = not vim.wo.wrap
    end
  '';
}
