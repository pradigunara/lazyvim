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
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        css = { "cssls" },
        json = { "jsonls" },
      },
    },
  },
}
