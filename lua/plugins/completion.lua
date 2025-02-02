return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "super-tab",
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
      },
    },
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      windows = {
        width = 50,
      },
      provider = "groq",
      openai = {
        model = "gpt-4o-mini",
      },
      gemini = {
        model = "gemini-2.0-flash-thinking-exp",
        temperature = 0.5,
      },
      vendors = {
        deepseek = {
          __inherited_from = "openai",
          api_key_name = "DEEPSEEK_API_KEY",
          endpoint = "https://api.deepseek.com",
          model = "deepseek-chat",
          temperature = 0,
        },
        deepinfra = {
          __inherited_from = "openai",
          api_key_name = "DEEPINFRA_API_KEY",
          endpoint = "https://api.deepinfra.com/v1/openai",
          model = "deepseek-ai/DeepSeek-V3",
          temperature = 0,
        },
        deepinfra_r1 = {
          __inherited_from = "openai",
          api_key_name = "DEEPINFRA_API_KEY",
          endpoint = "https://api.deepinfra.com/v1/openai",
          model = "deepseek-ai/DeepSeek-R1-Distill-Llama-70B",
          temperature = 0.5,
        },
        groq = {
          __inherited_from = "openai",
          api_key_name = "GROQ_API_KEY",
          endpoint = "https://api.groq.com/openai/v1",
          model = "deepseek-r1-distill-llama-70b",
          temperature = 0.5,
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
      -- {
      --   -- support for image pasting
      --   "HakonHarnes/img-clip.nvim",
      --   event = "VeryLazy",
      --   opts = {
      --     -- recommended settings
      --     default = {
      --       embed_image_as_base64 = false,
      --       prompt_for_file_name = false,
      --       drag_and_drop = {
      --         insert_mode = true,
      --       },
      --       -- required for Windows users
      --       use_absolute_path = true,
      --     },
      --   },
      -- },
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
