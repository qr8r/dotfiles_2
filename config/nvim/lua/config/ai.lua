require("codecompanion").setup({
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
})

vim.keymap.set({ "n", "x" }, "<leader>aa", ":CodeCompanionCLI Ask<cr>", { desc = "AI ask" })
