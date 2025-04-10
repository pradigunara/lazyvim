return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "super-tab",
      },
    },
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>a", group = "ai", icon = "" },
      },
    },
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      provider = "gemini",
      cursor_applying_provider = "groq_apply",
      web_search_engine = {
        provider = "brave",
      },
      behaviour = {
        enable_cursor_planning_mode = true,
      },
      windows = {
        width = 50,
      },
      openai = {
        model = "gpt-4o-mini",
      },
      gemini = {
        model = "gemini-2.0-pro-exp",
        temperature = 0.1,
        tools = {
          {
            google_search = vim.empty_dict(),
          },
        },
      },
      vendors = {
        openrouter = {
          __inherited_from = "openai",
          api_key_name = "OPENROUTER_API_KEY",
          endpoint = "https://openrouter.ai/api/v1",
          model = "meta-llama/llama-4-scout",
          temperature = 0.1,
          -- provider = {
          --   order = {
          --     "Lambda",
          --     "Groq",
          --   },
          -- },
        },
        groq_apply = {
          __inherited_from = "openai",
          api_key_name = "GROQ_API_KEY",
          endpoint = "https://api.groq.com/openai/v1",
          model = "llama-3.3-70b-versatile",
          max_completion_tokens = 32768,
        },
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      -- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      -- "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      -- "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            -- use_absolute_path = true,
          },
        },
      },
      -- {
      --   -- Make sure to set this up properly if you have lazy=true
      --   "MeanderingProgrammer/render-markdown.nvim",
      --   opts = {
      --     file_types = { "markdown", "Avante" },
      --   },
      --   ft = { "markdown", "Avante" },
      -- },
    },
  },
}
