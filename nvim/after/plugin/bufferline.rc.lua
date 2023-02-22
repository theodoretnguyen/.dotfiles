local found, bufferline = pcall(require, "bufferline")
if (not found) then return end

-- [[ Keymaps ]]
vim.keymap.set("n", "<s-l>", "<cmd>BufferLineCycleNext<cr>", { silent = true })
vim.keymap.set("n", "<s-h>", "<cmd>BufferLineCyclePrev<cr>", { silent = true })
vim.keymap.set("n", "[b", "<cmd>BufferLineMovePrev<cr>", { silent = true })
vim.keymap.set("n", "]b", "<cmd>BufferLineMoveNext<cr>", { silent = true })

-- [[ Configuration ]]
bufferline.setup({
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
})
