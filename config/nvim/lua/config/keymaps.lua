vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>n", "<cmd>set number!<cr>", { desc = "Toggle line numbers" })
vim.keymap.set("n", "<leader>d", "<C-w>d", { desc = "Show diagnostic" })

local function open_terminal()
  vim.cmd("botright new")
  vim.cmd("terminal")
  vim.cmd("startinsert")
end

vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>t", open_terminal, { desc = "Open terminal" })
vim.keymap.set("n", "<leader><leader>", open_terminal, { desc = "Open terminal" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move right" })
vim.keymap.set("n", "<leader>=", "<C-w>=", { desc = "Equalize windows" })
vim.keymap.set("n", "<leader>_", "<C-w>_", { desc = "Maximize window height" })
vim.keymap.set("n", "<leader>|", "<C-w>|", { desc = "Maximize window width" })

vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { desc = "Move left" })
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { desc = "Move down" })
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { desc = "Move up" })
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { desc = "Move right" })
