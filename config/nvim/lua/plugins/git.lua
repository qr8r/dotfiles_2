return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git", "Gclog", "Gtabedit", "Gdiffsplit", "Gvdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GRename", "GDelete", "GRemove" },
    keys = {
      { "<leader>gs", "<cmd>Gtabedit :<cr>", desc = "Git status" },
      { "<leader>gl", "<cmd>tab Gclog --reverse origin/HEAD..<cr>", desc = "Git log since origin HEAD" },
      { "<leader>gp", "<cmd>Git push --force-with-lease<cr>", desc = "Git force push with lease" },
      { "<leader>gP", "<cmd>!gh pr view --web<cr>", desc = "Open GitHub PR" },
    },
    config = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = { "FugitiveBlob", "FugitiveStageBlob" },
        callback = function(args)
          vim.keymap.set("n", "<leader>ge", function()
            local file = vim.fn["fugitive#Real"](vim.api.nvim_buf_get_name(0))
            vim.cmd.tabedit(("+%d %s"):format(vim.fn.line("."), vim.fn.fnameescape(file)))
          end, {
            buffer = args.buf,
            desc = "Edit real file at current line",
          })
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "FugitiveIndex",
        callback = function()
          vim.keymap.set("n", "cc", "<cmd>aboveleft Git commit<cr>", {
            buffer = true,
            silent = true,
            desc = "Git commit",
          })

          vim.keymap.set("n", "ca", "<cmd>aboveleft Git commit --amend<cr>", {
            buffer = true,
            silent = true,
            desc = "Git commit amend",
          })
        end,
      })
    end,
  },

  {
    "tpope/vim-rhubarb",
    dependencies = { "tpope/vim-fugitive" },
    cmd = { "GBrowse" },
  },

  {
    "tpope/vim-rails",
    ft = { "ruby", "eruby" },
    dependencies = { "tpope/vim-projectionist" },
  },
}
