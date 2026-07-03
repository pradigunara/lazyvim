return {
  {
    "folke/sidekick.nvim",
    opts = {
      nes = { enabled = false },
      cli = {
        tools = {
          omp = {
            cmd = { "omp" },
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
            width = 0.5,
          },
        },
      },
    },
  },
}
