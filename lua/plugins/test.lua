return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      spec = {
        { "<leader>t", group = "test" },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-jest",
      "fredrikaverpil/neotest-golang",
    },
    opts = {
      adapters = {
        ["neotest-jest"] = {
          jestCommand = "npm test --",
        },
        ["neotest-golang"] = {
          dap_go_enabled = true,
        },
      },
    },
  },
  {
    "mistweaverco/kulala.nvim",
    opts = {
      global_keymaps = true,
      kulala_keymaps = {
        ["Previous tab"] = {
          "H",
          function()
            require("kulala.ui").show_previous_tab()
          end,
          mode = { "n" },
        },
        ["Next tab"] = {
          "L",
          function()
            require("kulala.ui").show_next_tab()
          end,
          mode = { "n" },
        },
      },
    },
  },
}
