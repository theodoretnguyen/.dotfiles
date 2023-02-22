local found, harpoon = pcall(require, "harpoon")
if (not found) then return end

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
harpoon.setup({})
