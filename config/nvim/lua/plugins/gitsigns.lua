return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "▌" },
      change = { text = "▌" },
      delete = { text = "▌" },
      topdelete = { text = "▌" },
      changedelete = { text = "▌" },
    },
    signcolumn = true,
    numhl = false,
    linehl = false,
  },
  config = function(_, opts)
    vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#a6e22e", bg = "NONE" })
    vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#f4bf75", bg = "NONE" })
    vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#f92672", bg = "NONE" })
    require("gitsigns").setup(opts)
  end,
}
