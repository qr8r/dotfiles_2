return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
  },
  config = function()
    local cmp = require("cmp")
    local types = require("cmp.types")

    local deprioritized = {
      [types.lsp.CompletionItemKind.Text] = true,
      [types.lsp.CompletionItemKind.Snippet] = true,
      [types.lsp.CompletionItemKind.Keyword] = true,
    }

    local function expand_snippet(args)
      if vim.snippet then
        vim.snippet.expand(args.body)
      end
    end

    cmp.setup({
      completion = {
        autocomplete = false,
      },
      preselect = cmp.PreselectMode.Item,
      performance = {
        max_view_entries = 5,
      },
      formatting = {
        fields = { "abbr" },
        format = function(_, item)
          item.kind = ""
          item.menu = ""
          return item
        end,
      },
      sources = {
        { name = "buffer", keyword_length = 3, priority = 1000 },
        { name = "nvim_lsp", keyword_length = 3, priority = 500 },
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            cmp.complete()
          end
        end, { "i" }),
        ["<C-n>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            cmp.complete()
          end
        end, { "i" }),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-e>"] = cmp.mapping.abort(),
      }),
      sorting = {
        comparators = {
          function(entry1, entry2)
            local kind1 = entry1:get_kind()
            local kind2 = entry2:get_kind()
            local rank1 = deprioritized[kind1] and 0 or 1
            local rank2 = deprioritized[kind2] and 0 or 1

            if rank1 ~= rank2 then
              return rank1 > rank2
            end
          end,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.locality,
          cmp.config.compare.kind,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
    })

    cmp.setup.filetype("rust", {
      completion = {
        autocomplete = { cmp.TriggerEvent.TextChanged },
      },
      snippet = {
        expand = expand_snippet,
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp", keyword_length = 1, priority = 1000 },
        { name = "buffer", keyword_length = 4, priority = 250 },
      }),
    })
  end,
}
