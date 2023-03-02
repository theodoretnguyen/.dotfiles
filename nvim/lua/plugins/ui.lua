return {
  {
    "utilyre/barbecue.nvim",
    enabled = false,
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      { "nvim-tree/nvim-web-devicons", enabled = false },
    },
    config = true,
  },
  {
    "akinsho/bufferline.nvim",
    enabled = false,
    version = "v3.*",
    dependencies = { "nvim-tree/nvim-web-devicons", enabled = false },
    keys = {
      { "<s-l>", "<cmd>BufferLineCycleNext<cr>" },
      { "<s-h>", "<cmd>BufferLineCyclePrev<cr>" },
      { "[b", "<cmd>BufferLineMovePrev<cr>" },
      { "]b", "<cmd>BufferLineMoveNext<cr>" },
    },
    opts = {
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
        separator_style = "padded_slant",
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
    config = true,
  },
  {
    "nvim-lualine/lualine.nvim",
    enabled = false,
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
