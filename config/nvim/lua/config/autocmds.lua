vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    if not vim.bo.modifiable then
      return
    end

    local view = vim.fn.winsaveview()
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.winrestview(view)
  end,
})
