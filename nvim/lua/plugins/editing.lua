return {
  {
    "echasnovski/mini.pairs",
    version = false,
    config = function()
      require("mini.pairs").setup()
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "junegunn/vim-easy-align",
    init = function()
      vim.g.easy_align_ignore_groups = {}
      local delimiters = vim.g.easy_align_delimiters
      if type(delimiters) ~= "table" then
        delimiters = {}
      end

      delimiters["\\"] = {
        pattern = "\\\\",
        left_margin = 1,
        right_margin = 1,
      }

      vim.g.easy_align_delimiters = delimiters
      vim.keymap.set("x", "ga", "<Plug>(EasyAlign)", { desc = "Easy align" })
      vim.keymap.set("n", "ga", "<Plug>(EasyAlign)", { desc = "Easy align" })
      vim.keymap.set("x", "gA", "<Plug>(LiveEasyAlign)", { desc = "Easy align (live)" })
      vim.keymap.set("n", "gA", "<Plug>(LiveEasyAlign)", { desc = "Easy align (live)" })
    end,
  },
  {
    "echasnovski/mini.bracketed",
    version = false,
    config = function()
      require("mini.bracketed").setup()
    end,
  },
  {
    "echasnovski/mini.trailspace",
    version = false,
    config = function()
      require("mini.trailspace").setup()

      local group = vim.api.nvim_create_augroup("MiniTrailspace", { clear = true })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = group,
        callback = function()
          MiniTrailspace.trim()
          MiniTrailspace.trim_last_lines()
        end,
        desc = "Trim trailing whitespace on save",
      })
    end,
  },
}
