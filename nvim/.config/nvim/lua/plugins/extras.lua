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
    event = "VeryLazy",
    config = function()
      local whichkey = require('which-key')

      whichkey.add({
        { "<leader>1", hidden = true },
        { "<leader>2", hidden = true },
        { "<leader>3", hidden = true },
        { "<leader>4", hidden = true },
        { "<leader><space>", desc = "Buffers" },
        { "<leader>A", hidden = true },
        { "<leader>a", hidden = true },
        { "<leader>c", group = "Make" },
        { "<leader>d", hidden = true },
        { "<leader>f", group = "Find" },
        { "<leader>h", group = "Git" },
        { "<leader>l", group = "LSP" },
        { "<leader>m", group = "Markdown" },
        { "<leader>s", group = "Split" },
        { "<leader>t", group = "Tabs" },
        { "<leader>x", group = "Trouble" },
        { "<leader>y", hidden = true },
        { "<leader>z", desc = "Zen Mode" },
      })

      whichkey.add({
        { "<localleader>l", group = "LaTeX" },
        { "<localleader>lC", desc = "Clean Full" },
        { "<localleader>lG", desc = "Status All" },
        { "<localleader>lI", desc = "Info Full" },
        { "<localleader>lK", desc = "Stop All" },
        { "<localleader>lL", desc = "Compile Selected" },
        { "<localleader>lT", desc = "TOC Toggle" },
        { "<localleader>lX", desc = "Reload State" },
        { "<localleader>la", desc = "Context Menu" },
        { "<localleader>lc", desc = "Clean" },
        { "<localleader>le", desc = "Errors" },
        { "<localleader>lg", desc = "Status" },
        { "<localleader>li", desc = "Info" },
        { "<localleader>lk", desc = "Stop" },
        { "<localleader>ll", desc = "Compile" },
        { "<localleader>lm", desc = "Insert Mode Keymappings" },
        { "<localleader>lo", desc = "Compile Output" },
        { "<localleader>lq", desc = "Log" },
        { "<localleader>lr", desc = "Reverse Search" },
        { "<localleader>ls", desc = "Toggle Main" },
        { "<localleader>lt", desc = "TOC Open" },
        { "<localleader>lv", desc = "View" },
        { "<localleader>lx", desc = "Reload" },
      })

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
        icons = {
          rules = false,
        },
        win = {
          border = "rounded",
        },
        layout = {
          align = "center",
        },
        -- ignore_missing = false,
        show_help = false,
        show_keys = true,
        triggers = {
          { "<auto>", mode = "nixsotc" },
        },
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
  {
    "Eandrju/cellular-automaton.nvim",
    enabled = false,
    keys = {
      { "<leader>F", "<cmd>CellularAutomaton scramble<CR>", desc = "FML" }
    },
  },
}
