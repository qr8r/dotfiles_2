local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = " "

opt.number = false
opt.relativenumber = false
opt.cursorline = false
opt.signcolumn = "yes"
opt.termguicolors = true
opt.fillchars:append({ eob = " " })

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true

opt.wrap = true
opt.scrolloff = 8
opt.sidescrolloff = 8

opt.splitright = true
opt.splitbelow = true

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

opt.clipboard = ""
opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.updatetime = 300
opt.timeoutlen = 400
opt.mouse = ""
opt.cmdheight = 0

opt.list = true
opt.listchars = { tab = "> ", trail = "." }
opt.formatoptions = "crqnj" -- Be helpful with comments: continue them on Enter, format them with gq, handle numbered lists, and join comment lines cleanly.

opt.completeopt = { "menuone", "noselect", "popup" }
