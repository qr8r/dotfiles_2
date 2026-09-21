return {
  {
    "olimorris/codecompanion.nvim",
    cmd = { "CodeCompanion", "CodeCompanionActions", "CodeCompanionChat", "CodeCompanionCLI" },
    keys = {
      { "<leader>aa", ":CodeCompanionCLI Ask<cr>", mode = { "n", "x" }, desc = "AI ask" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      interactions = {
        cli = {
          agent = "pi",
          agents = {
            pi = {
              cmd = "pi",
              args = {},
              description = "Pi coding agent",
              provider = "terminal",
            },
          },
        },
      },
    },
  },
}
