local data_home = vim.env.XDG_DATA_HOME or (vim.fn.expand("~") .. "/.local/share")

return require("lazy").setup({
  require("plugins.completion"),
  require("plugins.editing"),
  require("plugins.formatting"),
  require("plugins.git"),
  require("plugins.gitsigns"),
  require("plugins.lint"),
  require("plugins.lsp"),
  require("plugins.obsidian"),
  require("plugins.rails"),
  require("plugins.telescope"),
  require("plugins.treesitter"),
  require("plugins.ui"),
  require("plugins.whichkey"),
}, {
  lockfile = data_home .. "/nvim/lazy-lock.json",
  root = data_home .. "/nvim/lazy",
  ui = {
    border = "single",
  },
  install = {
    colorscheme = { "base16-monokai" },
  },
})
