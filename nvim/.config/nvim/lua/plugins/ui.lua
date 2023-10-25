return {
  {
    "utilyre/barbecue.nvim",
    enabled = false,
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      { "nvim-tree/nvim-web-devicons" },
    },
    config = true,
  },
  {
    "akinsho/bufferline.nvim",
    enabled = true,
    version = "v3.*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.keymap.set("n", "<s-l>", "<cmd>BufferLineCycleNext<cr>")
      vim.keymap.set("n", "<s-h>", "<cmd>BufferLineCyclePrev<cr>")
      vim.keymap.set("n", "[b", "<cmd>BufferLineMovePrev<cr>")
      vim.keymap.set("n", "]b", "<cmd>BufferLineMoveNext<cr>")
      require("bufferline").setup({
        options = {
          mode = "buffers",
          indicator = {
            icon = "",
            style = "none",
          },
          diagnostics = "nvim_lsp",
          diagnostics_update_in_insert = false,
          diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return icon .. "(" .. count .. ")"
          end,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "center",
              separator = true,
            },
          },
          show_buffer_close_icons = false,
          -- if using kitty, "slant"
          -- if using alacritty, "padded_slant"
          separator_style = "slant",
        }
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = true,
    main = "ibl",
    opts = {},
  },
  {
    "nvim-lualine/lualine.nvim",
    enabled = true,
    opts = {
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = { "quickfix", "nvim-tree", "fzf", "toggleterm" },
    },
  },
}
