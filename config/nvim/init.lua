vim.g.mapleader = " "
vim.g.maplocalleader = " "

local data_home = vim.env.XDG_DATA_HOME or (vim.fn.expand("~") .. "/.local/share")
local lazypath = data_home .. "/nvim/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("config.options")
require("config.keymaps")
require("config.autocmds")

local function apply_lazy_hl()
  vim.api.nvim_set_hl(0, "LazyBorder", { fg = "#75715e", bg = "#272822" })
  vim.api.nvim_set_hl(0, "LazyTitle", { fg = "#272822", bg = "#ae81ff", bold = true })
  vim.api.nvim_set_hl(0, "LazyNormal", { fg = "#f8f8f2", bg = "#272822" })
end

apply_lazy_hl()

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("LazyColors", { clear = true }),
  callback = apply_lazy_hl,
})

require("plugins")
