return {
  {
    "ibhagwan/fzf-lua",
    cmd = { "FzfLua" },
    keys = {
      { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live grep" },
      { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Find buffers" },
      { "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "Help tags" },
    },
    opts = {
      fzf_colors = true,
      winopts = {
        on_create = function()
          vim.keymap.set("t", "<C-j>", "<Down>", { silent = true, buffer = true, desc = "Fzf list down" })
          vim.keymap.set("t", "<C-k>", "<Up>", { silent = true, buffer = true, desc = "Fzf list up" })
        end,
      },
    },
  },
}
