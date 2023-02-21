local status, cmp = pcall(require, "cmp")
if (not status) then return end
local luasnip = require("luasnip")
local lspkind = require("lspkind")

-- [[ General Configuration ]]
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol",
      maxwidth = 50,
      ellipsis_char = "...",
    })
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
})

-- [[ Filetype Configurations ]]

-- / and ? Modes
cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = function(_, vim_item)
      vim_item.kind = ""
      return vim_item
    end,
  },
})

-- : (Command) Mode
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
    }, {
      {
        name = "cmdline",
        option = {
          ignore_cmds = { "Man", "!" },
        },
      },
  }),
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = function(_, vim_item)
      vim_item.kind = ""
      return vim_item
    end,
  },
})
