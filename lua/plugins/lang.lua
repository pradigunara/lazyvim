return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "gopls",
        "vtsls",
        "css-lsp",
        "typescript-language-server",
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          -- Prepend arguments to disable rule MD013 (line-length)
          prepend_args = { "--config", '{"MD013": false}' },
        },
      },
    },
  },
  {
    "ice345/markdown-table-wrap.nvim",
    ft = { "markdown" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
      -- Toggle auto table rendering in the current buffer
      { "<leader>uW", "<cmd>MarkdownTableToggleAutoPreview<cr>", desc = "Toggle Markdown Table Wrap" },
    },
    opts = {
      -- Keeps your cursor from jumping unexpectedly
      inline_viewport_scrolling = false,
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      servers = {
        gopls = { -- https://www.lazyvim.org/extras/lang/go
          settings = {
            gopls = {
              analyses = {
                fieldalignment = false,
              },
            },
          },
        },
        -- eslint = {},
        -- jsonls = { -- copied directly from extras
        --   -- lazy-load schemastore when needed
        --   on_new_config = function(new_config)
        --     new_config.settings.json.schemas = new_config.settings.json.schemas or {}
        --     vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
        --   end,
        --   settings = {
        --     json = {
        --       format = { enable = true },
        --       validate = { enable = true },
        --     },
        --   },
        -- },
      },
      setup = {
        -- eslint = function()
        --   require("lazyvim.util").lsp.on_attach(function(client)
        --     if client.name == "eslint" then
        --       client.server_capabilities.documentFormattingProvider = true
        --     elseif client.name == "vtsls" then
        --       client.server_capabilities.documentFormattingProvider = false
        --     end
        --   end)
        -- end,
      },
    },
  },
}
