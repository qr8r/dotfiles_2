local data = vim.fn.stdpath("data")
local state = vim.fn.stdpath("state")
local config = vim.fn.stdpath("config")

local lazy_path = data .. "/lazy/lazy.nvim"

-- Home Manager links this config into ~/.config/nvim from the Nix store, so
-- files under stdpath("config") are read-only. lazy.nvim normally writes its
-- lockfile there; keep the mutable copy in XDG state instead, seeded from the
-- checked-in lockfile when bootstrapping a fresh machine.
local lockfile = state .. "/lazy-lock.json"
local lockfile_seed = config .. "/lazy-lock.json"

local function bootstrap_lazy()
  if vim.uv.fs_stat(lazy_path) then
    return
  end

  local repo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", repo, lazy_path })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

local function seed_lockfile()
  vim.fn.mkdir(vim.fn.fnamemodify(lockfile, ":h"), "p")

  if vim.fn.filereadable(lockfile) == 1 or vim.fn.filereadable(lockfile_seed) == 0 then
    return
  end

  vim.fn.writefile(vim.fn.readfile(lockfile_seed), lockfile)
end

bootstrap_lazy()
vim.opt.rtp:prepend(lazy_path)
seed_lockfile()

require("lazy").setup({
  lockfile = lockfile,
  spec = {
    { import = "plugins" },
  },
  install = {
    colorscheme = { "sonokai" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
