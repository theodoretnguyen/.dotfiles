-- [[ Imports ]]
local bufferline_setup, bufferline = pcall(require, "bufferline")
if not bufferline_setup then
  return
end

-- [[ Keymaps ]]
vim.keymap.set("n", "<s-l>", "<cmd>BufferLineCycleNext<cr>", { silent = true })
vim.keymap.set("n", "<s-h>", "<cmd>BufferLineCyclePrev<cr>", { silent = true })
vim.keymap.set("n", "[b", "<cmd>BufferLineMovePrev<cr>", { silent = true })
vim.keymap.set("n", "]b", "<cmd>BufferLineMoveNext<cr>", { silent = true })

-- [[ Configuration ]]
vim.o.mousemoveevent = true
bufferline.setup({
  options = {
    mode = "buffers",
    numbers = "none",
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    middle_mouse_command = nil,
    indicator = {
      icon = "",
      style = "none",
    },
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 18,
    max_prefix_length = 15,
    truncate_names = true,
    tab_size = 18,
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
    color_icons = true,
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_buffer_default_icon = true,
    show_close_icon = false,
    show_tab_indicators = true,
    show_duplicate_prefix = true,
    persist_buffer_sort = true,
    separator_style = "thin",
    always_show_bufferline = true,
    hover = {
      enabled = true,
      delay = 200,
      reveal = { "close" },
    },
    sort_by = "insert_after_current",
  },
})
