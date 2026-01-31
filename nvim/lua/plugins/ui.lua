return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("base16-monokai")
		end,
	},
	{
    "echasnovski/mini.statusline",
    version = false,
    config = function()
      local palette = {
        bg = "#272822",
        fg = "#f8f8f2",
        muted = "#75715e",
				red = "#f92672",
				green = "#a6e22e",
				yellow = "#f4bf75",
				blue = "#66d9ef",
				purple = "#ae81ff",
				cyan = "#a1efe4",
			}

			vim.api.nvim_set_hl(0, "MiniStatuslineModeNormal", { fg = palette.bg, bg = palette.blue, bold = true })
			vim.api.nvim_set_hl(0, "MiniStatuslineModeInsert", { fg = palette.bg, bg = palette.green, bold = true })
			vim.api.nvim_set_hl(0, "MiniStatuslineModeVisual", { fg = palette.bg, bg = palette.purple, bold = true })
			vim.api.nvim_set_hl(0, "MiniStatuslineModeReplace", { fg = palette.bg, bg = palette.red, bold = true })
			vim.api.nvim_set_hl(0, "MiniStatuslineModeCommand", { fg = palette.bg, bg = palette.yellow, bold = true })
			vim.api.nvim_set_hl(0, "MiniStatuslineModeOther", { fg = palette.bg, bg = palette.cyan, bold = true })

      vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { fg = palette.blue, bg = palette.bg })
      vim.api.nvim_set_hl(0, "MiniStatuslineFilenameInactive", { fg = palette.purple, bg = palette.bg })
      vim.api.nvim_set_hl(0, "MiniStatuslineFilenameModified", { fg = palette.yellow, bg = palette.bg })
      vim.api.nvim_set_hl(0, "MiniStatuslineDevinfo", { fg = palette.muted, bg = palette.bg })
      vim.api.nvim_set_hl(0, "MiniStatuslineFileinfo", { fg = palette.muted, bg = palette.bg })
      vim.api.nvim_set_hl(0, "MiniStatuslineInactive", { fg = palette.muted, bg = palette.bg })

      vim.api.nvim_set_hl(0, "WinSeparator", { fg = palette.muted, bg = palette.bg })

      local function active()
        local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
        local git = MiniStatusline.section_git({ trunc_width = 40 })
        local diff = MiniStatusline.section_diff({ trunc_width = 75 })
        local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
        local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
        local filename = MiniStatusline.section_filename({ trunc_width = 140 })
        local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
        local location = MiniStatusline.section_location({ trunc_width = 75 })
        local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

        local filename_hl = "MiniStatuslineFilename"
        if vim.bo.modified then
          filename_hl = "MiniStatuslineFilenameModified"
        end

        return MiniStatusline.combine_groups({
          { hl = mode_hl, strings = { mode } },
          { hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
          "%<",
          { hl = filename_hl, strings = { filename } },
          "%=",
          { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
          { hl = mode_hl, strings = { search, location } },
        })
      end

      local function inactive()
        local filename = MiniStatusline.section_filename({ trunc_width = 140 })
        local filename_hl = "MiniStatuslineFilenameInactive"

        if vim.bo.modified then
          filename_hl = "MiniStatuslineFilenameModified"
        end

        return MiniStatusline.combine_groups({
          { hl = filename_hl, strings = { filename } },
        })
      end

      require("mini.statusline").setup({
        content = {
          active = active,
          inactive = inactive,
        },
      })
    end,
  },
  {
    "echasnovski/mini.tabline",
    version = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local palette = {
        bg = "#272822",
        fg = "#f8f8f2",
        muted = "#75715e",
        red = "#f92672",
        green = "#a6e22e",
        yellow = "#f4bf75",
        blue = "#66d9ef",
        purple = "#ae81ff",
      }

      local function apply_tabline_hl()
        vim.api.nvim_set_hl(0, "MiniTablineCurrent", { fg = palette.blue, bg = palette.bg, bold = true })
        vim.api.nvim_set_hl(0, "MiniTablineVisible", { fg = palette.purple, bg = palette.bg })
        vim.api.nvim_set_hl(0, "MiniTablineHidden", { fg = palette.muted, bg = palette.bg })
        vim.api.nvim_set_hl(0, "MiniTablineFill", { fg = palette.muted, bg = palette.bg })
        vim.api.nvim_set_hl(0, "MiniTablineModifiedCurrent", { fg = palette.yellow, bg = palette.bg, bold = true })
        vim.api.nvim_set_hl(0, "MiniTablineModifiedVisible", { fg = palette.yellow, bg = palette.bg })
        vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden", { fg = palette.yellow, bg = palette.bg })
        vim.api.nvim_set_hl(0, "MiniTablineTabpageActive", { fg = palette.blue, bg = palette.bg, bold = true })
        vim.api.nvim_set_hl(0, "MiniTablineTabpageInactive", { fg = palette.muted, bg = palette.bg })
        vim.api.nvim_set_hl(0, "MiniTablineTabpagesection", { fg = palette.muted, bg = palette.bg })
        vim.api.nvim_set_hl(0, "TabLine", { fg = palette.fg, bg = palette.bg })
        vim.api.nvim_set_hl(0, "TabLineFill", { fg = palette.muted, bg = palette.bg })
        vim.api.nvim_set_hl(0, "TabLineSel", { fg = palette.blue, bg = palette.bg, bold = true })
      end

      local function icon_only_label(buf_id)
        local name = vim.api.nvim_buf_get_name(buf_id)
        local has_devicons, devicons = pcall(require, "nvim-web-devicons")
        if not has_devicons then
          return vim.fn.fnamemodify(name, ":t")
        end

        return devicons.get_icon(vim.fn.fnamemodify(name, ":t"), nil, { default = true }) or ""
      end

      require("mini.tabline").setup({
        tabpage_section = "none",
        format = function(buf_id, label)
          local icon = icon_only_label(buf_id)
          local text = icon ~= "" and icon .. " " or label .. " "

          return text
        end,
      })

      apply_tabline_hl()

      local tabline_group = vim.api.nvim_create_augroup("TablineColors", { clear = true })
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = tabline_group,
        callback = apply_tabline_hl,
      })

      local function tab_dots()
        local total = vim.fn.tabpagenr("$")
        if total <= 1 then
          return ""
        end

        local current = vim.fn.tabpagenr()
        local dots = {}

        for idx = 1, total do
          local hl = idx == current and "MiniTablineTabpageActive" or "MiniTablineTabpageInactive"
          table.insert(dots, "%#" .. hl .. "#⬤")
        end

        return " " .. table.concat(dots, " ") .. " "
      end

      local make_tabline = MiniTabline.make_tabline_string
      MiniTabline.make_tabline_string = function()
        local line = make_tabline()
        local dots = tab_dots()

        if dots ~= "" then
          line = line .. "%=" .. dots
        end

        return line
      end
    end,
  },
}
