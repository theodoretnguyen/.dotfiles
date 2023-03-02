return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter" },
  dependencies = {
    -- sources
    "hrsh7th/cmp-nvim-lsp", -- nvim_lsp : LSP source
    "saadparwaiz1/cmp_luasnip", -- luasnip : snippets source
    "hrsh7th/cmp-nvim-lua", -- nvim_lua : neovim's lua api
    "hrsh7th/cmp-buffer", -- buffer : buffer source
    "hrsh7th/cmp-path", -- path : filesystem paths source
    "hrsh7th/cmp-cmdline", -- cmdline : command line suggestions
    -- kind icons
    "onsails/lspkind.nvim",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- [[ General Configuration ]]
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
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
        format = require('lspkind').cmp_format({
          mode = "symbol",
          preset = "default",
        }),
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "nvim_lua" },
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
        format = function(_, vim_item)
          vim_item.kind = ""
          return vim_item
        end,
      },
    })
  end,
}
