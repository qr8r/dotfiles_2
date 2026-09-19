-- Native Neovim plugin management.
--
-- Add plugins here with vim.pack.add(). Example:
--
-- local plugins = {
--   "https://github.com/tpope/vim-fugitive",
-- }
--
-- Update installed plugins from Neovim with:
--   :lua vim.pack.update()

local plugins = {
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
  "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
  "https://github.com/windwp/nvim-ts-autotag",
  "https://github.com/neovim/nvim-lspconfig",
  { src = "https://github.com/Saghen/blink.cmp", version = "v1" },
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/mfussenegger/nvim-lint",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/sainnhe/sonokai",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/tpope/vim-projectionist",
  "https://github.com/tpope/vim-rails",
  "https://github.com/tpope/vim-rhubarb",
  "https://github.com/junegunn/vim-easy-align",
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/windwp/nvim-autopairs",
  "https://github.com/tpope/vim-endwise",
  "https://github.com/tpope/vim-surround",
  "https://github.com/vim-test/vim-test",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/olimorris/codecompanion.nvim",
}

if #plugins > 0 then
  vim.pack.add(plugins, { confirm = false, load = true })
end
