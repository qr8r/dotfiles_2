-- Neovim provides default diagnostics and LSP keymaps.
-- See :help lsp-defaults

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLsp", { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    if not client then
      return
    end

    if client:supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
    end
  end,
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

vim.lsp.enable({
  "lua_ls",
  "ruby_lsp",
  "rust_analyzer",
  "ts_ls",
  "emmet_language_server",
  "nixd",
})
