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
  '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>gH";
      action = "+github";
    }
    {
      mode = "n";
      key = "<leader>gHt";
      action = "<cmd>LTPanel<CR>";
      options = {
        desc = "Toggle Litee panel";
      };
    }
    {
      mode = "n";
      key = "<leader>gHc";
      action = "+github commits";
    }
    {
      mode = "n";
      key = "<leader>gHcc";
      action = "<cmd>GHCloseCommit<CR>";
      options = {
        desc = "Close commit";
      };
    }
    {
      mode = "n";
      key = "<leader>gHce";
      action = "<cmd>GHExpandCommit<CR>";
      options = {
        desc = "Expand commit";
      };
    }
    {
      mode = "n";
      key = "<leader>gHco";
      action = "<cmd>GHOpenToCommit<CR>";
      options = {
        desc = "Open to commit";
      };
    }
    {
      mode = "n";
      key = "<leader>gHcp";
      action = "<cmd>GHPopOutCommit<CR>";
      options = {
        desc = "Pop out commit";
      };
    }
    {
      mode = "n";
      key = "<leader>gHcz";
      action = "<cmd>GHCollapseCommit<CR>";
      options = {
        desc = "Collapse commit";
      };
    }
    {
      mode = "n";
      key = "<leader>gHp";
      action = "+github pull requests";
    }
    {
      mode = "n";
      key = "<leader>gHpo";
      action = "<cmd>GHOpenPR<CR>";
      options = {
        desc = "Open pull requests";
      };
    }
    {
      mode = "n";
      key = "<leader>gHi";
      action = "+github issues";
    }
    {
      mode = "n";
      key = "<leader>gHip";
      action = "<cmd>GHPreviewIssue<CR>";
      options = {
        desc = "Preview issue";
      };
    }
    {
      mode = "n";
      key = "<leader>gHpc";
      action = "<cmd>GHClosePR<CR>";
      options = {
        desc = "Close PR";
      };
    }
    {
      mode = "n";
      key = "<leader>gHpd";
      action = "<cmd>GHPRDetails<CR>";
      options = {
        desc = "PR details";
      };
    }
    {
      mode = "n";
      key = "<leader>gHpe";
      action = "<cmd>GHExpandPR<CR>";
      options = {
        desc = "Expand PR";
      };
    }
    {
      mode = "n";
      key = "<leader>gHpp";
      action = "<cmd>GHPopOutPR<CR>";
      options = {
        desc = "Pop out PR";
      };
    }
    {
      mode = "n";
      key = "<leader>gHpr";
      action = "<cmd>GHRefreshPR<CR>";
      options = {
        desc = "Refresh PR";
      };
    }
    {
      mode = "n";
      key = "<leader>gHpt";
      action = "<cmd>GHOpenToPR<CR>";
      options = {
        desc = "Open to PR";
      };
    }
    {
      mode = "n";
      key = "<leader>gHpz";
      action = "<cmd>GHCollapsePR<CR>";
      options = {
        desc = "Collapse PR";
      };
    }
    {
      mode = "n";
      key = "<leader>gHr";
      action = "+github review";
    }
    {
      mode = "n";
      key = "<leader>gHrb";
      action = "<cmd>GHStartReview<CR>";
      options = {
        desc = "Start review";
      };
    }
    {
      mode = "n";
      key = "<leader>gHrc";
      action = "<cmd>GHCloseReview<CR>";
      options = {
        desc = "Close review";
      };
    }
    {
      mode = "n";
      key = "<leader>gHrd";
      action = "<cmd>GHDeleteReview<CR>";
      options = {
        desc = "Delete review";
      };
    }
    {
      mode = "n";
      key = "<leader>gHre";
      action = "<cmd>GHExpandReview<CR>";
      options = {
        desc = "Expand review";
      };
    }
    {
      mode = "n";
      key = "<leader>gHrs";
      action = "<cmd>GHSubmitReview<CR>";
      options = {
        desc = "Submit review";
      };
    }
    {
      mode = "n";
      key = "<leader>gHrz";
      action = "<cmd>GHCollapseReview<CR>";
      options = {
        desc = "Collapse review";
      };
    }
    {
      mode = "n";
      key = "<leader>gHT";
      action = "+github threads";
    }
    {
      mode = "n";
      key = "<leader>gHTc";
      action = "<cmd>GHCreateThread<CR>";
      options = {
        desc = "Create thread";
      };
    }
    {
      mode = "n";
      key = "<leader>gHTn";
      action = "<cmd>GHNextThread<CR>";
      options = {
        desc = "Next thread";
      };
    }
    {
      mode = "n";
      key = "<leader>gHTt";
      action = "<cmd>GHToggleThread<CR>";
      options = {
        desc = "Toggle thread";
      };
    }
  ];
}
