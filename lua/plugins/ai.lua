return {
  {
    "folke/sidekick.nvim",
    opts = {
      nes = { enabled = false },
      cli = {
        tools = {
          ccrcode = {
            cmd = { "ccr", "code" },
          },
          gemini = {
            env = {
              GEMINI_MODEL = "gemini-3-pro-preview",
            },
          },
          droid = {
            cmd = { "droid" },
          },
          opencode = {
            keys = {
              prompt = {
                "<a-p>",
              },
            },
          },
        },
        mux = {
          backend = "tmux",
          enabled = true,
        },
        win = {
          split = {
            width = 80,
          },
        },
      },
    },
  },
  -- {
  --   "coder/claudecode.nvim",
  --   dependencies = { "folke/snacks.nvim" },
  --   opts = {
  --     terminal_cmd = "~/.claude-code-router/custom/ccrcode", -- Point to local installation
  --     terminal = {
  --       split_width_percentage = 0.5,
  --     },
  --     focus_after_send = true,
  --   },
  --   config = true,
  --   keys = {
  --     { "<leader>a", nil, desc = "AI/Claude Code" },
  --     { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
  --     { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
  --     { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
  --     { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
  --     { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
  --     { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
  --     { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
  --     {
  --       "<leader>as",
  --       "<cmd>ClaudeCodeTreeAdd<cr>",
  --       desc = "Add file",
  --       ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
  --     },
  --     -- Diff management
  --     { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
  --     { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
  --   },
  -- },
}
