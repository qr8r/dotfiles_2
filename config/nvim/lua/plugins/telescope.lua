return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  opts = {
    defaults = {
      border = true,
      borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      layout_config = {
        prompt_position = "top",
      },
      sorting_strategy = "ascending",
      preview = {
        timeout = 300,
      },
    },
  },
  config = function(_, opts)
    vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#75715e", bg = "NONE" })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#75715e", bg = "NONE" })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = "#75715e", bg = "NONE" })
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = "#75715e", bg = "NONE" })
    vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = "#f8f8f2", bg = "#272822" })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { fg = "#f8f8f2", bg = "#272822" })
    vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { fg = "#f8f8f2", bg = "#272822" })
    vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { fg = "#f8f8f2", bg = "#272822" })
    require("telescope").setup(opts)
  end,
}
