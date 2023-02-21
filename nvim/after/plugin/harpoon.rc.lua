-- [[ Imports ]]
local harpoon_setup, harpoon = pcall(require, "harpoon")
if not harpoon_setup then
  return
end

-- [[ Keymaps ]]
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", mark.add_file, { silent = true, desc = "Add File" })
vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu, { silent = true, desc = "Quick Menu"})
vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { silent = true })
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, { silent = true })
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, { silent = true })
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, { silent = true })
vim.keymap.set("n", "<leader>hp", ui.nav_prev, { silent = true, desc = "Prev File"})
vim.keymap.set("n", "<leader>hn", ui.nav_next, { silent = true, desc = "Next File"})

-- [[ Configuration ]]
harpoon.setup({
  save_on_toggle = false,
  save_on_change = true,
  enter_on_sendcmd = false,
  tmux_autoclose_windows = false,
  excluded_filetypes = { "harpoon" },
  mark_branch = false,
})
