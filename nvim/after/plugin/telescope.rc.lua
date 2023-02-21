-- [[ Imports ]]
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  return
end

-- [[ Configuration ]]
-- See `:help telescope` and `:help telescope.setup()`
local action = require("telescope.actions")
telescope.setup({
  defaults = {
    prompt_prefix = "   ",
    selection_caret = "   ",
    entry_prefix = "  ",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_ignore_patterns = { "node_modules" },
    path_display = { "truncate" },
    winblend = 0,
    border = true,
    borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    color_devicons = true,
    prompt_title = false,
    mappings = {
      i = {
        ["<esc>"] = action.close,
        ["<c-u>"] = false,
        ["<c-d>"] = false,
        ["<c-j>"] = action.preview_scrolling_down,
        ["<c-k>"] = action.preview_scrolling_up,
      },
    },
  },
  -- pickers = {
  --   colorscheme = {
  --     enable_preview = true,
  --   },
  -- },
  extensions_list = {},
})

-- See `:help telescope.builtin`
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Files" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Current Word" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>fj", function()
  builtin.current_buffer_fuzzy_find(themes.get_dropdown({
    winblend = 0,
    previewer = false,
    borderchars = {
      { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
      prompt = {"─", "│", " ", "│", '┌', '┐', "│", "│"},
      results = {"─", "│", "─", "│", "├", "┤", "┘", "└"},
      preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
    },
    selection_caret = "  ",
    entry_prefix = "  ",
  }))
end, { desc = "Within Current Buffer" })
vim.keymap.set("n", "<leader>fc", function()
  builtin.colorscheme(themes.get_dropdown({
    previewer = false,
  }))
end, { desc = "Colorschemes" })
vim.keymap.set("n", "<leader>fs", function()
  builtin.spell_suggest(themes.get_dropdown({
    previewer = false,
    selection_caret = "  ",
    entry_prefix = "  ",
}))
end, { desc = "Spelling Suggestions" })
