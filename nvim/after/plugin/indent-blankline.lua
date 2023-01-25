-- [[ Imports ]]
local indent_blankline_setup, indent_blankline = pcall(require, "indent_blankline")
if not indent_blankline_setup then
  return
end

-- [[ Configuration ]]
indent_blankline.setup({
  use_treesitter = true,
  show_current_context = false,
  show_current_context_start = false,
  -- char_list = { "|", "¦", "┆", "┊" },
  -- context_char_list = { '┃', '║', '╬', '█' }
})
