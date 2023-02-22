local found, telescope = pcall(require, "telescope")
if (not found) then return end
local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

-- [[ Configuration ]]
telescope.setup({})

-- [[ Keymaps ]]
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Files" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Current Word" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>fc", builtin.colorscheme, { desc = "Colorschemes" })
vim.keymap.set("n", "<leader>fs", builtin.spell_suggest,  { desc = "Spelling Suggestions" })
vim.keymap.set("n", "<leader>fj", function()
  builtin.current_buffer_fuzzy_find(themes.get_dropdown({
    previewer = false,
  }))
end, { desc = "Within Current Buffer" })
