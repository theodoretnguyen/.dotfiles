return {
  {
    "nvim-tree/nvim-tree.lua",
    enabled = true,
    dependencies = { "nvim-tree/nvim-web-devicons", enabled = true },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "File Explorer" },
    },
    opts = {
      disable_netrw = true,
      hijack_netrw = true,
      hijack_unnamed_buffer_when_opening = true,
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader><space>", "<cmd>Telescope buffers<cr>",       desc = "Buffers" },
      { "<leader>fr",      "<cmd>Telescope oldfiles<cr>",      desc = "Recent files" },
      { "<leader>ff",      "<cmd>Telescope find_files<cr>",    desc = "Files" },
      { "<leader>fh",      "<cmd>Telescope help_tags<cr>",     desc = "Help" },
      { "<leader>fw",      "<cmd>Telescope grep_string<cr>",   desc = "Current Word" },
      { "<leader>fg",      "<cmd>Telescope live_grep<cr>",     desc = "Grep" },
      { "<leader>fd",      "<cmd>Telescope diagnostics<cr>",   desc = "Diagnostics" },
      { "<leader>fk",      "<cmd>Telescope keymaps<cr>",       desc = "Keymaps" },
      { "<leader>fs",      "<cmd>Telescope spell_suggest<cr>", desc = "Spelling Suggestions" },
      {
        "<leader>fj",
        "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({previewer=false}))<cr>",
        desc = "Within Current Buffer"
      },
      {
        "<leader>fc",
        "<cmd>lua require('telescope.builtin').colorscheme(require('telescope.themes').get_ivy({previewer=true}))<cr>",
        desc = "Colorschemes"
      },
    },
    opts = {
      pickers = {
        colorscheme = {
          enable_preview = true,
        }
      }
    },
  },
  {
    "stevearc/oil.nvim",
    keys = {
      { "<leader>E", "<cmd>Oil<cr>", desc = "Oil" },
    },
    opts = {
      view_options = {
        show_hidden = true,
      }
    }
  }
}
