local fzf = require("fzf-lua")

fzf.setup({
  fzf_colors = true,
  winopts = {
    on_create = function()
      vim.keymap.set("t", "<C-j>", "<Down>", { silent = true, buffer = true, desc = "Fzf list down" })
      vim.keymap.set("t", "<C-k>", "<Up>", { silent = true, buffer = true, desc = "Fzf list up" })
    end,
  },
})

vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Help tags" })
