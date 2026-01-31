local keymap = vim.keymap.set

keymap("n", "<leader>/f", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
keymap("n", "<leader>/b", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
keymap("n", "<leader>/g", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
keymap("n", "<leader>/s", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Document symbols" })
keymap("n", "<leader>/t", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
keymap("n", "<leader>/?", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })

keymap("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })

keymap("n", "<leader>n", function()
  local enabled = vim.opt.number:get()
  local next_value = not enabled

  vim.opt.number = next_value
  vim.opt.relativenumber = false

  for _, win in ipairs(vim.api.nvim_list_wins()) do
    vim.api.nvim_win_set_option(win, "number", next_value)
    vim.api.nvim_win_set_option(win, "relativenumber", false)
  end
end, { desc = "Toggle line numbers" })

keymap("n", "<leader>bc", function()
  for _, buffer in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
    if buffer.name == "" then
      vim.cmd("bdelete " .. buffer.bufnr)
    end
  end
end, { desc = "Close unnamed buffers" })

keymap({ "n", "v" }, "<leader>c", '"+y', { desc = "Yank to clipboard" })

keymap({ "n", "i", "v" }, "<Up>", "<Nop>", { desc = "Disable Up" })
keymap({ "n", "i", "v" }, "<Down>", "<Nop>", { desc = "Disable Down" })
keymap({ "n", "i", "v" }, "<Left>", "<Nop>", { desc = "Disable Left" })
keymap({ "n", "i", "v" }, "<Right>", "<Nop>", { desc = "Disable Right" })

keymap("n", "<leader>ff", function()
  require("conform").format({ async = true })
end, { desc = "Format file" })
