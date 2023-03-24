return {
  {
    "NvChad/nvim-colorizer.lua",
    ft = { "css" },
    opts = {
      filetypes = { "css" },
      user_default_options = {
        mode = "background",
        rgb_fn = true,
      },
    },
  },
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        autochdir = true,
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        open_mapping = [[<c-\>]],
        hide_numbers = false,
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = false,
        terminal_mappings = true,
        persist_size = false,
        persist_mode = false,
        direction = "float",
        close_on_exit = true,
        float_opts = {
          border = "rounded",
          winblend = 0,
        },
      })
    end,
  },
  {
    "folke/which-key.nvim",
    config = function()
      local whichkey = require('which-key')

      whichkey.register({
        f = { name = "Find" },
        l = { name = "LSP" },
        s = { name = "Split"},
        c = { name = "Make"},
        m = { name = "Markdown"},
        h = { name = "Git" },
        x = { name = "Trouble" },
        y = { name = "which_key_ignore" },
        d = { name = "which_key_ignore" },
        t = { name = "Tabs" },
        z = "Zen Mode",
        ["<space>"] = "Buffers",
        ["1"] = "which_key_ignore",
        ["2"] = "which_key_ignore",
        ["3"] = "which_key_ignore",
        ["4"] = "which_key_ignore",
        ["a"] = "which_key_ignore",
        ["A"] = "which_key_ignore",
      }, { prefix = "<leader>" })

      whichkey.register({
        l = {
          name = "LaTeX",
          i = "Info",
          I = "Info Full",
          t = "TOC Open",
          T = "TOC Toggle",
          q = "Log",
          v = "View",
          r = "Reverse Search",
          l = "Compile",
          L = "Compile Selected",
          k = "Stop",
          K = "Stop All",
          e = "Errors",
          o = "Compile Output",
          g = "Status",
          G = "Status All",
          c = "Clean",
          C = "Clean Full",
          m = "Insert Mode Keymappings",
          x = "Reload",
          X = "Reload State",
          s = "Toggle Main",
          a = "Context Menu",
        },
      }, { prefix = "<localleader>" })

      whichkey.setup({
        presets = {
          operators = false,
          motions = false,
          text_objects = false,
          windows = false,
          nav = false,
          z = true,
          g = false,
        },
        key_labels = {
          ["<space>"] = "SPC",
        },
        window = {
          border = "rounded",
        },
        layout = {
          align = "center",
        },
        ignore_missing = false,
        show_help = false,
        show_keys = true,
        triggers = "auto",
      })
    end,
  },
  {
    "folke/zen-mode.nvim",
    dependencies = { "folke/twilight.nvim", config = true },
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", { desc = "Zen Mode" } },
    },
    opts = {
      window = {
        backdrop = 1,
        width = 80,
        height = 0.85,
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
          cursorline = false,
          cursorcolumn = false,
          foldcolumn = "0",
          list = false,
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
        },
        twilight = { enabled = true },
        gitsigns = { enabled = false },
      },
    }
  },
}
