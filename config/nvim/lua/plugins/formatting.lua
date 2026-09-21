return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo", "Format" },
    opts = {
      format_on_save = {
        timeout_ms = 2000,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        rust = { "rustfmt" },
        ruby = { "rubocop" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        markdown = { "prettier" },
        nix = { "nixfmt", "alejandra", stop_after_first = true },
      },
    },
    config = function(_, opts)
      require("conform").setup(opts)

      vim.api.nvim_create_user_command("Format", function()
        require("conform").format({ lsp_format = "fallback" })
      end, {})
    end,
  },
}
