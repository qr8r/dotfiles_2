local lint = require("lint")

lint.linters_by_ft = {
  ruby = { "rubocop" },
  javascript = { "eslint" },
  javascriptreact = { "eslint" },
  typescript = { "eslint" },
  typescriptreact = { "eslint" },
  sh = { "shellcheck" },
  bash = { "shellcheck" },
  nix = { "nix", "statix", "deadnix" },
}

local group = vim.api.nvim_create_augroup("UserLint", { clear = true })

vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
  group = group,
  callback = function()
    lint.try_lint(nil, { ignore_errors = true })
  end,
})

vim.api.nvim_create_user_command("Lint", function()
  lint.try_lint(nil, { ignore_errors = false })
end, {})
