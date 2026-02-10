return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    vim.api.nvim_set_hl(0, "WhichKey", { fg = "#ae81ff", bg = "NONE" })
    vim.api.nvim_set_hl(0, "WhichKeyDesc", { fg = "#75715e", bg = "NONE" })

    require("which-key").setup({
      delay = 500,
    })
  end,
}
