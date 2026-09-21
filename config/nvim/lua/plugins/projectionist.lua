local js_ts_projections = {
  ["*.ts"] = { alternate = { "{}.test.ts", "{}.spec.ts" }, type = "source" },
  ["*.tsx"] = { alternate = { "{}.test.tsx", "{}.spec.tsx", "{}.test.ts", "{}.spec.ts" }, type = "source" },
  ["*.js"] = { alternate = { "{}.test.js", "{}.spec.js" }, type = "source" },
  ["*.jsx"] = { alternate = { "{}.test.jsx", "{}.spec.jsx", "{}.test.js", "{}.spec.js" }, type = "source" },

  ["*.test.ts"] = { alternate = { "{}.ts", "{}.tsx" }, type = "test" },
  ["*.spec.ts"] = { alternate = { "{}.ts", "{}.tsx" }, type = "test" },
  ["*.test.tsx"] = { alternate = "{}.tsx", type = "test" },
  ["*.spec.tsx"] = { alternate = "{}.tsx", type = "test" },
  ["*.test.js"] = { alternate = { "{}.js", "{}.jsx" }, type = "test" },
  ["*.spec.js"] = { alternate = { "{}.js", "{}.jsx" }, type = "test" },
  ["*.test.jsx"] = { alternate = "{}.jsx", type = "test" },
  ["*.spec.jsx"] = { alternate = "{}.jsx", type = "test" },
}

return {
  {
    "tpope/vim-projectionist",
    event = { "BufReadPre", "BufNewFile" },
    init = function()
      vim.g.projectionist_heuristics = vim.tbl_deep_extend("force", vim.g.projectionist_heuristics or {}, {
        ["package.json|tsconfig.json|jsconfig.json"] = js_ts_projections,
      })
    end,
  },
}
