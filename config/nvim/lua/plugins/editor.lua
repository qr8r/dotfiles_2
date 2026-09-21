return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "junegunn/vim-easy-align",
    keys = {
      { "ga", "<Plug>(EasyAlign)", mode = { "n", "x" }, desc = "Easy align" },
    },
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  {
    "tpope/vim-endwise",
    event = "InsertEnter",
  },

  {
    "tpope/vim-surround",
    event = "VeryLazy",
  },
}
