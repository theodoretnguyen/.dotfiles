return {
  "akinsho/bufferline.nvim",
  enabled = false,
  version = "v3.*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
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
      separator_style = "slant",
    },
  },
}
