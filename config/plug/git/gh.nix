{ pkgs, ... }: {
  extraPlugins = with pkgs.vimPlugins; [
    litee-nvim
    (pkgs.vimUtils.buildVimPlugin {
      pname = "gh.nvim";
      version = "6f367b2ab8f9d4a0a23df2b703a3f91137618387";
      dependencies = with pkgs.vimPlugins; [ litee-nvim ];
      src = pkgs.fetchFromGitHub {
        owner = "ldelossa";
        repo = "gh.nvim";
        rev = "6f367b2ab8f9d4a0a23df2b703a3f91137618387";
        hash = "sha256-XI4FVjajin0NM+OaEN+O5vmalPpOB2RII+aOERSzjJA=";
      };
    })
  ];

  extraPackages = with pkgs; [
    gh
    git
  ];

  extraConfigLua = ''
    require("litee.lib").setup()

    require("litee.gh").setup({
      map_resize_keys = false,
    })

    local ok, wk = pcall(require, "which-key")
    if ok then
      wk.add({
        { "<leader>gH", group = "GitHub" },
        { "<leader>gHc", group = "Commits" },
        { "<leader>gHi", group = "Issues" },
        { "<leader>gHl", group = "Litee" },
        { "<leader>gHp", group = "Pull requests" },
        { "<leader>gHr", group = "Review" },
        { "<leader>gHt", group = "Threads" },
      })
    end
  '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>gHlt";
      action = "<cmd>LTPanel<CR>";
      options = {
        desc = "Toggle Litee panel";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHcc";
      action = "<cmd>GHCloseCommit<CR>";
      options = {
        desc = "Close commit";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHce";
      action = "<cmd>GHExpandCommit<CR>";
      options = {
        desc = "Expand commit";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHco";
      action = "<cmd>GHOpenToCommit<CR>";
      options = {
        desc = "Open to commit";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHcp";
      action = "<cmd>GHPopOutCommit<CR>";
      options = {
        desc = "Pop out commit";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHcz";
      action = "<cmd>GHCollapseCommit<CR>";
      options = {
        desc = "Collapse commit";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHio";
      action = "<cmd>GHOpenIssue<CR>";
      options = {
        desc = "Open issue";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHip";
      action = "<cmd>GHPreviewIssue<CR>";
      options = {
        desc = "Preview issue";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHis";
      action = "<cmd>GHSearchIssues<CR>";
      options = {
        desc = "Search issues";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHn";
      action = "<cmd>GHNotifications<CR>";
      options = {
        desc = "Open notifications";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHw";
      action = "<cmd>GHViewWeb<CR>";
      options = {
        desc = "Open in browser";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHpo";
      action = "<cmd>GHOpenPR<CR>";
      options = {
        desc = "Open pull request";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHpc";
      action = "<cmd>GHClosePR<CR>";
      options = {
        desc = "Close PR";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHpd";
      action = "<cmd>GHPRDetails<CR>";
      options = {
        desc = "PR details";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHpe";
      action = "<cmd>GHExpandPR<CR>";
      options = {
        desc = "Expand PR";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHpp";
      action = "<cmd>GHPopOutPR<CR>";
      options = {
        desc = "Pop out PR";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHpr";
      action = "<cmd>GHRefreshPR<CR>";
      options = {
        desc = "Refresh PR";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHps";
      action = "<cmd>GHSearchPRs<CR>";
      options = {
        desc = "Search pull requests";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHpt";
      action = "<cmd>GHOpenToPR<CR>";
      options = {
        desc = "Open to PR";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHpz";
      action = "<cmd>GHCollapsePR<CR>";
      options = {
        desc = "Collapse PR";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHrb";
      action = "<cmd>GHStartReview<CR>";
      options = {
        desc = "Start review";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHra";
      action = "<cmd>GHApproveReview<CR>";
      options = {
        desc = "Approve review";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHrc";
      action = "<cmd>GHCloseReview<CR>";
      options = {
        desc = "Close review";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHrd";
      action = "<cmd>GHDeleteReview<CR>";
      options = {
        desc = "Delete review";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHre";
      action = "<cmd>GHExpandReview<CR>";
      options = {
        desc = "Expand review";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHrs";
      action = "<cmd>GHSubmitReview<CR>";
      options = {
        desc = "Submit review";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHrz";
      action = "<cmd>GHCollapseReview<CR>";
      options = {
        desc = "Collapse review";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHtc";
      action = "<cmd>GHCreateThread<CR>";
      options = {
        desc = "Create thread";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHtn";
      action = "<cmd>GHNextThread<CR>";
      options = {
        desc = "Next thread";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gHtt";
      action = "<cmd>GHToggleThreads<CR>";
      options = {
        desc = "Toggle threads";
        silent = true;
      };
    }
  ];
}
