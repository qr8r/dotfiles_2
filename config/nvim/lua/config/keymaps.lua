vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>n", "<cmd>set number!<cr>", { desc = "Toggle line numbers" })
vim.keymap.set("n", "<leader>d", function()
  vim.diagnostic.open_float()
end, { desc = "Show diagnostic" })

local function open_terminal()
  vim.cmd("botright new")
  vim.cmd("terminal")
  vim.cmd("startinsert")
end

local function open_codecompanion_cli_tab()
  vim.cmd("tabnew")
  vim.cmd("CodeCompanionCLI")
end

vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
vim.keymap.set("n", "<leader>t", open_terminal, { desc = "Open terminal" })
vim.keymap.set("n", "<leader><CR>", open_terminal, { desc = "Open terminal" })
vim.keymap.set("n", "<leader><leader>", open_codecompanion_cli_tab, { desc = "Open CodeCompanion CLI" })

vim.keymap.set("n", "<leader>=", "<C-w>=", { desc = "Equalize windows" })
vim.keymap.set("n", "<leader>_", "<C-w>_", { desc = "Maximize window height" })
vim.keymap.set("n", "<leader>|", "<C-w>|", { desc = "Maximize window width" })

