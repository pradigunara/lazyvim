return {
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
      -- ===== MCPHub Integration =====
      -- system_prompt as function ensures LLM always has latest MCP server state
      -- This is evaluated for every message, even in existing chats
      system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        return hub and hub:get_active_servers_prompt() or ""
      end,
      -- Using function prevents requiring mcphub before it's loaded
      custom_tools = function()
        return {
          require("mcphub.extensions.avante").mcp_tool(),
        }
      end,
      -- ==============================

      provider = "zai",
      -- mode = "legacy",
      behaviour = {
        -- enable_fastapply = true,
      },
      web_search_engine = {
        provider = "brave",
      },
      windows = {
        width = 60,
        sidebar_header = { enabled = false },
        input = { height = 10 },
      },
      providers = {
        gemini = {
          model = "gemini-2.5-pro",
          extra_request_body = {
            temperature = 0.7,
          },
        },
        morph = {
          model = "morph-v3-fast",
        },
        grokcode = {
          __inherited_from = "openai",
          api_key_name = "OPENROUTER_API_KEY",
          endpoint = "https://openrouter.ai/api/v1",
          model = "x-ai/grok-code-fast-1",
        },
        chutes = {
          __inherited_from = "openai",
          api_key_name = "CHUTES_API_KEY",
          endpoint = "https://llm.chutes.ai/v1",
          model = "deepseek-ai/DeepSeek-V3.1",
          extra_request_body = {
            temperature = 0.6,
            max_completion_tokens = 16384,
          },
        },
        moonshot = {
          __inherited_from = "openai",
          api_key_name = "MOONSHOT_API_KEY",
          endpoint = "https://api.moonshot.ai/v1",
          model = "kimi-k2-0905-preview",
          extra_request_body = {
            temperature = 0.6,
            max_tokens = 16384,
          },
        },
        zai = {
          __inherited_from = "openai",
          api_key_name = "ZAI_API_KEY",
          endpoint = "https://api.z.ai/api/coding/paas/v4",
          model = "glm-4.5",
          extra_request_body = {
            temperature = 0.6,
            max_tokens = 98304,
          },
        },
        groq = {
          __inherited_from = "openai",
          api_key_name = "GROQ_API_KEY",
          endpoint = "https://api.groq.com/openai/v1",
          model = "moonshotai/kimi-k2-instruct",
          extra_request_body = {
            temperature = 0.7,
            max_completion_tokens = 16384,
          },
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
      --       -- use_absolute_path = true,
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
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "volta install mcp-hub", -- Installs `mcp-hub` node binary globally
    config = function()
      require("mcphub").setup()
    end,
  },
}
