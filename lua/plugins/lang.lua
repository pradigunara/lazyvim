return {
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
        eslint = {},
      },
      setup = {
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "ts_ls" then
              client.server_capabilities.documentFormattingProvider = false
            elseif client.name == "vtsls" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
}
