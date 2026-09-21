return {
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    init = function()
      vim.g.sonokai_style = "andromeda"
      vim.g.sonokai_better_performance = 1
    end,
    config = function()
      vim.cmd.colorscheme("sonokai")
      vim.cmd("highlight Folded guibg=NONE")
      vim.api.nvim_set_hl(0, "FoldColumn", { link = "Comment" })
    end,
  },
}
