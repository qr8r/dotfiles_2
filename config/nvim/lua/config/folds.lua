vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldcolumn = "1"
vim.opt.fillchars:append({ fold = " ", foldopen = " ", foldclose = "❯", foldsep = " ", foldinner = " " })
