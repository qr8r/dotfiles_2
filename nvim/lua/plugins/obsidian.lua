return {
  "epwalsh/obsidian.nvim",
  version = "*",
  ft = { "markdown" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "main",
          path = "~/Desktop/Obsidian",
        },
      },
      templates = {
        subdir = "templates",
      },
      finder = "telescope.nvim",
      completion = {
        -- nvim-cmp is available, but obsidian completion stays disabled for now.
        nvim_cmp = false,
      },
      mappings = {
        ["gf"] = {
          action = require("obsidian").util.gf_passthrough,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ["gt"] = {
          action = "toggle_checkbox",
          opts = { buffer = true },
        },
      },
    })

    local keymap = vim.keymap.set
    keymap("n", "<leader>of", "<cmd>ObsidianSearch<cr>", { desc = "Obsidian search" })
    keymap("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "Obsidian new note" })
    keymap("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", { desc = "Obsidian backlinks" })
    keymap("n", "<leader>ot", "<cmd>ObsidianTemplate<cr>", { desc = "Obsidian template" })
    keymap("n", "<leader>oo", "<cmd>ObsidianOpen<cr>", { desc = "Obsidian open app" })
  end,
}
