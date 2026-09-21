return {
  {
    "vim-test/vim-test",
    cmd = { "TestFile", "TestLast", "TestNearest", "TestSuite", "TestVisit" },
    init = function()
      vim.g["test#strategy"] = "neovim"
    end,
  },
}
