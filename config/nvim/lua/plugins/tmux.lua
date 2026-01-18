return {
  -- Seamless navigation between tmux panes and Neovim splits
  -- Works with christoomey/vim-tmux-navigator plugin in tmux.conf
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Navigate to left pane/split" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Navigate to down pane/split" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Navigate to up pane/split" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate to right pane/split" },
      { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Navigate to previous pane/split" },
    },
  },

  -- Session management for tmux-resurrect integration
  -- Enables Neovim session restoration when tmux sessions are restored
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
      -- Directory where session files are saved
      dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
      -- Sessionoptions used for saving
      options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp" },
    },
    keys = {
      {
        "<leader>qs",
        function()
          require("persistence").load()
        end,
        desc = "Restore Session",
      },
      {
        "<leader>ql",
        function()
          require("persistence").load({ last = true })
        end,
        desc = "Restore Last Session",
      },
      {
        "<leader>qd",
        function()
          require("persistence").stop()
        end,
        desc = "Don't Save Current Session",
      },
    },
  },
}
