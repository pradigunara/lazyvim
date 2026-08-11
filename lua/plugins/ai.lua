return {
  {
    "folke/sidekick.nvim",
    opts = {
      nes = { enabled = false },
      cli = {
        tools = {
          omp = {
            cmd = { "omp" },
            keys = {
              prompt = {
                "<a-p>",
              },
            },
          },
          reasonix = {
            cmd = { "reasonix" },
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
          grok = {
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
            width = 0.5,
          },
        },
      },
    },
  },
}
