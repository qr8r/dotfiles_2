return {
  "neovim/nvim-lspconfig",
  ft = {
    "bash",
    "containerfile",
    "css",
    "dockerfile",
    "html",
    "hcl",
    "helm",
    "javascript",
    "javascriptreact",
    "json",
    "jsonc",
    "lua",
    "nix",
    "ruby",
    "rust",
    "scss",
    "sh",
    "terraform",
    "toml",
    "typescript",
    "typescriptreact",
    "yaml",
  },
  dependencies = {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
  },
  config = function()
    local data_home = vim.env.XDG_DATA_HOME or (vim.fn.expand("~") .. "/.local/share")
    local is_nix = vim.env.NIX_PATH ~= nil and vim.env.NIX_PATH ~= ""
    local mason_root = data_home .. "/nvim/mason"
    local mason_bin = mason_root .. "/bin"
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

    if ok_cmp then
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    end

    if not is_nix then
      vim.api.nvim_set_hl(0, "MasonBorder", { fg = "#75715e", bg = "NONE" })
      vim.api.nvim_set_hl(0, "MasonHeader", { fg = "#272822", bg = "#ae81ff", bold = true })
      vim.api.nvim_set_hl(0, "MasonNormal", { fg = "#f8f8f2", bg = "#272822" })
      vim.api.nvim_set_hl(0, "MasonNormalFloat", { fg = "#f8f8f2", bg = "#272822" })

      if not string.find(vim.env.PATH or "", mason_bin, 1, true) then
        vim.env.PATH = mason_bin .. ":" .. (vim.env.PATH or "")
      end

      require("mason").setup({
        install_root_dir = mason_root,
        ui = {
          border = "single",
        },
      })

      require("mason-lspconfig").setup({
        automatic_installation = true,
        ensure_installed = {
          "rust_analyzer",
          "taplo",
        },
      })
    end

    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#66d9ef", bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#ae81ff", bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#66d9ef", bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#66d9ef", bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#66d9ef", bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiagnosticBorderError", { fg = "#ae81ff", bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiagnosticBorderWarn", { fg = "#66d9ef", bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiagnosticBorderInfo", { fg = "#66d9ef", bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiagnosticBorderHint", { fg = "#66d9ef", bg = "NONE" })

    vim.diagnostic.config({
      severity_sort = true,
      underline = true,
      update_in_insert = false,
      virtual_text = {
        prefix = "●",
        source = "if_many",
        spacing = 2,
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "▌",
          [vim.diagnostic.severity.WARN] = "▌",
          [vim.diagnostic.severity.INFO] = "▌",
          [vim.diagnostic.severity.HINT] = "▌",
        },
      },
      float = {
        border = "single",
        source = "if_many",
      },
    })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "single",
    })

    local function border_with_hl(hl)
      return {
        { "┌", hl },
        { "─", hl },
        { "┐", hl },
        { "│", hl },
        { "┘", hl },
        { "─", hl },
        { "└", hl },
        { "│", hl },
      }
    end

    local function diagnostic_border(severity)
      if severity == vim.diagnostic.severity.ERROR then
        return border_with_hl("DiagnosticBorderError")
      end
      if severity == vim.diagnostic.severity.WARN then
        return border_with_hl("DiagnosticBorderWarn")
      end
      if severity == vim.diagnostic.severity.INFO then
        return border_with_hl("DiagnosticBorderInfo")
      end
      return border_with_hl("DiagnosticBorderHint")
    end

    local function open_diagnostic_float()
      local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
      local severity = vim.diagnostic.severity.HINT

      for _, item in ipairs(diagnostics) do
        if item.severity and item.severity < severity then
          severity = item.severity
        end
      end

      vim.diagnostic.open_float(0, {
        border = diagnostic_border(severity),
        scope = "cursor",
        source = "if_many",
      })
    end

    local original_open_float = vim.diagnostic.open_float

    vim.diagnostic.open_float = function(bufnr, opts)
      local options = opts or {}
      local buffer = bufnr or 0
      local lnum = options.lnum or (vim.fn.line(".") - 1)
      local diagnostics = vim.diagnostic.get(buffer, { lnum = lnum })
      local severity = vim.diagnostic.severity.HINT

      for _, item in ipairs(diagnostics) do
        if item.severity and item.severity < severity then
          severity = item.severity
        end
      end

      options.border = diagnostic_border(severity)
      return original_open_float(buffer, options)
    end

    local on_attach = function(client, bufnr)
      local keymap = vim.keymap.set
      local opts = { buffer = bufnr }

      vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

      if vim.lsp.inlay_hint and client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end

      keymap("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "LSP definition" }))
      keymap("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "LSP references" }))
      keymap("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "LSP implementation" }))
      keymap("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "LSP hover" }))
      keymap("n", "<leader>lr", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "LSP rename" }))
      keymap("n", "<leader>la", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "LSP code action" }))
      keymap("n", "<leader>ld", open_diagnostic_float, vim.tbl_extend("force", opts, { desc = "LSP diagnostics" }))
    end

    local configured = {}

    local function setup_server(name, config)
      if configured[name] then
        return
      end

      config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
      vim.lsp.config(name, config)
      vim.lsp.enable(name)
      configured[name] = true
    end

    local server_by_ft = {
      bash = function()
        setup_server("bashls", { on_attach = on_attach })
      end,
      sh = function()
        setup_server("bashls", { on_attach = on_attach })
      end,
      html = function()
        setup_server("html", { on_attach = on_attach })
        setup_server("emmet_ls", { on_attach = on_attach })
      end,
      css = function()
        setup_server("cssls", { on_attach = on_attach })
      end,
      scss = function()
        setup_server("cssls", { on_attach = on_attach })
      end,
      json = function()
        setup_server("jsonls", { on_attach = on_attach })
      end,
      jsonc = function()
        setup_server("jsonls", { on_attach = on_attach })
      end,
      dockerfile = function()
        setup_server("dockerls", { on_attach = on_attach })
      end,
      containerfile = function()
        setup_server("dockerls", { on_attach = on_attach })
      end,
      yaml = function()
        setup_server("yamlls", { on_attach = on_attach })
      end,
      terraform = function()
        setup_server("terraformls", { on_attach = on_attach })
      end,
      hcl = function()
        setup_server("terraformls", { on_attach = on_attach })
      end,
      helm = function()
        setup_server("helm_ls", { on_attach = on_attach })
      end,
      ruby = function()
        setup_server("ruby_lsp", { on_attach = on_attach })
      end,
      rust = function()
        setup_server("rust_analyzer", {
          on_attach = on_attach,
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
              },
              check = {
                command = "clippy",
              },
            },
          },
        })
      end,
      toml = function()
        setup_server("taplo", { on_attach = on_attach })
      end,
      javascript = function()
        setup_server("ts_ls", { on_attach = on_attach })
        setup_server("eslint", { on_attach = on_attach })
        setup_server("tailwindcss", { on_attach = on_attach })
        setup_server("emmet_ls", { on_attach = on_attach })
      end,
      javascriptreact = function()
        setup_server("ts_ls", { on_attach = on_attach })
        setup_server("eslint", { on_attach = on_attach })
        setup_server("tailwindcss", { on_attach = on_attach })
        setup_server("emmet_ls", { on_attach = on_attach })
      end,
      typescript = function()
        setup_server("ts_ls", { on_attach = on_attach })
        setup_server("eslint", { on_attach = on_attach })
        setup_server("tailwindcss", { on_attach = on_attach })
        setup_server("emmet_ls", { on_attach = on_attach })
      end,
      typescriptreact = function()
        setup_server("ts_ls", { on_attach = on_attach })
        setup_server("eslint", { on_attach = on_attach })
        setup_server("tailwindcss", { on_attach = on_attach })
        setup_server("emmet_ls", { on_attach = on_attach })
      end,
      lua = function()
        setup_server("lua_ls", {
          on_attach = on_attach,
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = { globals = { "vim" } },
              workspace = { library = vim.api.nvim_get_runtime_file("", true) },
              telemetry = { enable = false },
            },
          },
        })
      end,
      nix = function()
        setup_server("nixd", { on_attach = on_attach })
      end,
    }

    vim.api.nvim_create_autocmd("FileType", {
      pattern = vim.tbl_keys(server_by_ft),
      callback = function(event)
        local handler = server_by_ft[event.match]
        if handler then
          handler()
        end
      end,
    })

    local initial_ft = vim.bo.filetype
    local initial_handler = server_by_ft[initial_ft]
    if initial_handler then
      initial_handler()
    end
  end,
}
