return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      bash = { "shellcheck" },
      sh = { "shellcheck" },
      dockerfile = { "hadolint" },
      containerfile = { "hadolint" },
      hcl = { "tflint" },
      terraform = { "tflint" },
      javascript = { "eslint" },
      javascriptreact = { "eslint" },
      typescript = { "eslint" },
      typescriptreact = { "eslint" },
      json = { "eslint" },
      jsonc = { "eslint" },
      lua = { "selene" },
      nix = { "statix", "deadnix" },
      ruby = { "rubocop" },
      yaml = { "yamllint" },
      ["yaml.ansible"] = { "yamllint", "ansible_lint" },
    }

    local lint_group = vim.api.nvim_create_augroup("Lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
      group = lint_group,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
