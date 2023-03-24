return {
  "L3MON4D3/LuaSnip",
  event = { "InsertEnter" },
  dependencies = { "rafamadriz/friendly-snippets", enabled = true },
  config = function()
    local luasnip = require("luasnip")
    vim.keymap.set("n", "<leader>S",
    function()
      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/"})
      print("~ Loaded Snippets! ~")
    end,
    { silent = true, desc = "Load Snippets" }
    )
    vim.cmd[[
    imap <silent><expr> <tab> luasnip#expand_or_jumpable() ? "<Plug>luasnip-expand-or-jump" : "<tab>"
    smap <silent><expr> <tab> luasnip#jumpable(1) ? "<Plug>luasnip-jump-next" : "<tab>"
    imap <silent><expr> <s-tab> luasnip#jumpable(-1) ? "<Plug>luasnip-jump-prev" : "<s-tab>"
    smap <silent><expr> <s-tab> luasnip#jumpable(-1) ? "<Plug>luasnip-jump-prev" : "<s-tab>"
    ]]

    luasnip.config.set_config({
      history = true,
      store_selection_keys = "<tab>",
      update_events = "TextChanged,TextChangedI",
      region_check_events = "InsertEnter",
      delete_check_events = "TextChanged",
      enable_autosnippets = true,
    })

    require("luasnip.loaders.from_lua").lazy_load({
      paths = "~/.config/nvim/snippets/"
    })

    -- [[ Include html snippets in js/jsx/tsx ]]
    luasnip.filetype_extend("javascript", { "html" })
    luasnip.filetype_extend("javascriptreact", { "html" })
    luasnip.filetype_extend("typescriptreact", { "html" })

    -- [[ VSCode-like Snippets ]]
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
