vim.keymap.set("n", "<leader>gs", "<cmd>Gtabedit :<cr>", { desc = "Git status" })
vim.keymap.set("n", "<leader>gp", "<cmd>Git push --force-with-lease<cr>", { desc = "Git force push with lease" })
vim.keymap.set("n", "<leader>gP", "<cmd>!gh pr view --web<cr>", { desc = "Open GitHub PR" })

vim.api.nvim_create_autocmd("User", {
  pattern = "FugitiveIndex",
  callback = function()
    vim.keymap.set("n", "cc", "<cmd>aboveleft Git commit<cr>", {
      buffer = true,
      silent = true,
      desc = "Git commit",
    })

    vim.keymap.set("n", "ca", "<cmd>aboveleft Git commit --amend<cr>", {
      buffer = true,
      silent = true,
      desc = "Git commit amend",
    })
  end,
})
