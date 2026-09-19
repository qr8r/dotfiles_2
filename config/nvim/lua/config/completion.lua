require("blink.cmp").setup({
  keymap = {
    preset = "default",
    ["<C-y>"] = { "select_and_accept", "fallback" },
  },
  sources = {
    default = { "lsp", "path", "buffer" },
  },
  fuzzy = {
    implementation = "lua",
  },
  completion = {
    documentation = {
      auto_show = true,
    },
  },
})
