return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      numhl = true,
      current_line_blame = true,
    },
    keys = {
      { "<leader>gl", require("gitsigns").toggle_linehl, desc = "Toggle Line Highlight" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = { mode = "cursor", max_lines = 5 },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local actions = require("telescope.actions")

      return {
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-l>"] = actions.select_default,
              ["<C-h>"] = actions.close,
            },
            n = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-l>"] = actions.select_default,
              ["<C-h>"] = actions.close,
            },
          },
        },
      }
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      event_handlers = {
        {
          event = "file_opened",
          handler = function(file_path)
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<leader>bj", "<cmd>BufferLinePick<cR>", desc = "Jump Buffer" },
    },
  },
}
