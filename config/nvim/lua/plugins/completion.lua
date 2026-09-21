return {
  {
    "saghen/blink.cmp",
    version = "v1",
    event = "InsertEnter",
    opts = {
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
    },
  },
}
