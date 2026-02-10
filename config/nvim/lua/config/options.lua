local opt = vim.opt

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

opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8

opt.splitright = true
opt.splitbelow = true
opt.laststatus = 3

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

opt.list = true
opt.listchars = { tab = "> ", trail = ".", extends = ">", precedes = "<" }
opt.formatoptions = "crqnj"

opt.fillchars:append({
  vert = "┆",
  vertleft = "┆",
  vertright = "┆",
  verthoriz = "┆",
  horiz = "┄",
  horizup = "┄",
  horizdown = "┄",
})

opt.completeopt = { "menu", "menuone", "noinsert" }
